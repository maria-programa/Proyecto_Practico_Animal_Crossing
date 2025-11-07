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
    
    init(modelView: FishesModelView = FishesModelView()) {
        self.modelView = modelView
    }
    
    func onAppear() async {
        await loadFishes()
    }
    
    private func loadFishes() async {
        do {
            state = .loading
            
            guard let url = URL(string: "https://api.nookipedia.com/nh/fish")
            else {
                return
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.allHTTPHeaderFields = ["X-API-KEY":"bc30978a-43a8-4df6-83f9-1acd0b8628bb"]
            
            let (data, response)  = try await URLSession.shared.data(for: urlRequest)
            let decodedData = try JSONDecoder().decode(Array<FishModelServer>.self, from: data)
            
            let fishes = decodedData.compactMap { model in
                FishModel (
                    specie: model.name,
                    catchPhrase: model.catchphrases.first ?? "",
                    location: model.location,
                    time: model.north.availability_array.first?.time ?? "",
                    shadowSize: model.shadow_size,
                    abailabilityNorth: model.north.availability_array.first?.months ?? "",
                    abailabilitySouth: model.south.availability_array.first?.months ?? "",
                    sellingPriceNook: model.sell_nook,
                    sellingPriceCJ: model.sell_cj
                )
                
            }
            
            modelView.collectionItems = fishes
            state = .success
            
        } catch {
            state = .failure
            print(error)
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
