//
//  BugsViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 6/11/25.
//

import Foundation
import SwiftUI
import Combine

class BugsViewModel: BaseViewModel {
    @Published var state: ViewModelState = .initial
    @Published var modelView: BugsModelView
    let api = APICall()
    let userDefaultManager = UserDefaultsManager()
    
    init(
        model: BugsModelView = BugsModelView()
    ) {
        self.modelView = model
    }
    
    func onAppear() async {
        if modelView.collectionItems.isEmpty {
            await loadBugs()
        }
    }
    
    func handleLikedItem(_ model: BugModel) {
        guard let modelIndex = modelView.collectionItems.firstIndex(of: model)
        else {
            return
        }
        
        if model.isLiked {
            userDefaultManager.deleteItems(model.name, .likedBugs)
        } else {
            userDefaultManager.saveItems(model.name, .likedBugs)
        }
        modelView.collectionItems[modelIndex].isLiked.toggle()
    }
    
    private func loadBugs() async {
        do {
            state = .loading
            
            let decodedData = try await api.request(
                endpoint: "nh/bugs",
                method: .get,
                modelServer: Array<BugModelServer>.self
            )
            
            let bugs = decodedData.compactMap { model in
                BugModel(
                    specie: model.name,
                    catchPhrase: model.catchphrases.first ?? "",
                    location: model.location,
                    time: model.north.availability_array.first?.time ?? "",
                    weather: model.weather,
                    abailabilityNorth: model.north.availability_array.first?.months ?? "",
                    abailabilitySouth: model.south.availability_array.first?.months ?? "",
                    sellingPriceNook: model.sell_nook,
                    sellingPriceKamilo: model.sell_flick,
                    imageURL: URL(string: model.image_url),
                    renderImageURL: URL(string: model.render_url),
                    isLiked: userDefaultManager.checkIfItemIsLiked(model.name, .likedBugs)
                )
            }
            
            modelView.collectionItems = bugs
            state = .success
        } catch {
            modelView.errorDescription = error.localizedDescription
            state = .failure
        }
    }
    
    private func checkIfModelIsLiked(_ id: String) -> Bool {
        return false
    }
}

struct BugModelServer: Decodable {
    let url: String
    let name: String
    let number: Int
    let image_url: String
    let render_url: String
    let location: String
    let weather: String
    let rarity: String
    let total_catch: Int
    let sell_nook: Int
    let sell_flick: Int
    let tank_width: Int
    let tank_length: Int
    let catchphrases: [String]
    let north: BugsHemisphereModelServer
    let south: BugsHemisphereModelServer
}

struct BugsHemisphereModelServer: Decodable {
    let availability_array: [BugsAvailabilityModelServer]
    let times_by_month: BugsTimesByMonthModelServer
    let months: String
    let months_array: [Int]
}

struct BugsAvailabilityModelServer: Decodable {
    let months: String
    let time: String
}

struct BugsTimesByMonthModelServer: Decodable {
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
