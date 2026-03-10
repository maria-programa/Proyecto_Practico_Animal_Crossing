//
//  FishesViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 4/11/25.
//

import Foundation
import SwiftUI
import Combine

class FishesViewModel: BaseViewModel {
    @Published var state: ViewModelState = .initial
    @Published var modelView: FishesModelView
    let api = APICall()
    let userDefaultManager = UserDefaultsManager()
    let favouritesStore = FavouritesStore.shared
    
    init(
        modelView: FishesModelView = FishesModelView()
    ) {
        self.modelView = modelView
    }
    
    func onAppear() async {
        if modelView.collectionItems.isEmpty {
            await loadFishes()
        }
        filterFishes()
    }
    
    func handleLikedItem(_ model: FishModel) {
        guard let modelIndex = modelView.filteredFishes.firstIndex(of: model)
        else {
            return
        }
        
        if model.isLiked {
            userDefaultManager.deleteItems(model.name, .likedFishes)
            favouritesStore.deleteFish(id: model.name)
        } else {
            userDefaultManager.saveItems(model.name, .likedFishes)
            favouritesStore.addFish(model)
        }
        modelView.filteredFishes[modelIndex].isLiked.toggle()
    }
    
    private func loadFishes() async {
        do {
            state = .loading
            
            let decodedData = try await api.request(
                endpoint: "nh/fish",
                method: .get,
                modelServer: Array<FishModelServer>.self
            )
            
            let fishes = decodedData.compactMap { model in
                let fish = FishModel (
                    specie: model.name,
                    catchPhrase: model.catchphrases.first ?? "",
                    location: model.location,
                    time: model.north.availability_array.first?.time ?? "",
                    shadowSize: model.shadow_size,
                    rarity: model.rarity,
                    abailabilityNorth: model.north.availability_array.first?.months ?? "",
                    abailabilitySouth: model.south.availability_array.first?.months ?? "",
                    sellingPriceNook: model.sell_nook,
                    sellingPriceCJ: model.sell_cj,
                    imageURL: URL(string: model.image_url),
                    renderImageURL: URL(string: model.render_url),
                    isLiked: userDefaultManager.checkIfItemIsLiked(model.name, .likedFishes)
                )
                
                if fish.isLiked {
                    favouritesStore.addFish(fish)
                }
                
                return fish
            }
            
            modelView.collectionItems = fishes
            state = .success
            
        } catch {
            modelView.errorDescription = error.localizedDescription
            state = .failure
        }
    }
    
    func filterFishes(){
        let commonFishes = modelView.collectionItems.filter {
            $0.rarity == "Common"
        }
        
        let uncommonFishes = modelView.collectionItems.filter {
            $0.rarity == "Uncommon"
        }
        
        let rareFishes = modelView.collectionItems.filter {
            $0.rarity == "Rare"
        }
        
        if userDefaultManager.get(forKey: .selectedRadioButton, type: String.self) == "Común" {
            modelView.filteredFishes = commonFishes
        } else if userDefaultManager.get(forKey: .selectedRadioButton, type: String.self) == "Poco común" {
            modelView.filteredFishes = uncommonFishes
        } else if userDefaultManager.get(forKey: .selectedRadioButton, type: String.self) == "Raro" {
            modelView.filteredFishes = rareFishes
        } else {
            modelView.filteredFishes = modelView.collectionItems
        }
    }
}

struct FishModelServer: Decodable {
    let url: String
    let name: String
    let number: Int
    let image_url: String
    let render_url: String
    let location: String
    let shadow_size: String
    let rarity: String
    let total_catch: Int
    let sell_nook: Int
    let sell_cj: Int
    let tank_width: Int
    let tank_length: Int
    let catchphrases: [String]
    let north: HemisphereModelServer
    let south: HemisphereModelServer
}

struct HemisphereModelServer: Decodable {
    let availability_array: [AvailabilityModelServer]
    let times_by_month: TimesByMonthModelServer
    let months: String
    let months_array: [Int]
}

struct AvailabilityModelServer: Decodable {
    let months: String
    let time: String
}

struct TimesByMonthModelServer: Decodable {
    let one: String
    let two: String
    let three: String
    let four: String
    let five: String
    let six: String
    let seven: String
    let eight: String
    let nine: String
    let ten: String
    let eleven: String
    let twelve: String
    
    public enum CodingKeys: String, CodingKey {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "11"
        case twelve = "12"
    }
}
