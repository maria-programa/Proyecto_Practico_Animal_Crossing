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
    
    init(
        model: BugsModelView = BugsModelView()
    ) {
        self.modelView = model
    }
    
    func onAppear() async {
       await loadBugs()
    }
    
    private func loadBugs() async {
        do {
            state = .loading
            
            guard let url = URL(string: "https://api.nookipedia.com/nh/bugs")
            else {
                return
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.allHTTPHeaderFields = ["X-API-KEY":"bc30978a-43a8-4df6-83f9-1acd0b8628bb"]
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            let decodedData = try JSONDecoder().decode(Array<BugModelServer>.self, from: data)
            
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
                    sellingPriceKamilo: model.sell_flick
                )
            }
            
            modelView.collectionItems = bugs
            state = .success
        } catch {
            state = .failure
        }
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
