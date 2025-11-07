//
//  VillagersViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 5/11/25.
//

import Foundation
import SwiftUI
import Combine

//enum ViewModelState {
//    case initial
//}

class VillagersViewModel: BaseViewModel {
    @Published var modelView: VillagersModelView
    @Published var state: ViewModelState = .initial
    
    init(modelView: VillagersModelView = VillagersModelView()) {
        self.modelView = modelView
    }
    
    func onAppear() async {
        if modelView.collectionItems.isEmpty {
            await loadVillagers()
        }
    }
    
    private func loadVillagers() async {
        do {
            state = .loading
            //-------
            guard let url = URL(string: "https://api.nookipedia.com/villagers")
            else{
                return
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.allHTTPHeaderFields = ["X-API-KEY":"bc30978a-43a8-4df6-83f9-1acd0b8628bb"]
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            let decodedData = try JSONDecoder().decode(Array<VillagerModelServer>.self, from: data)
            //-------
            let villagers = decodedData.compactMap { model in
                VillagerModel(
                    image: Image(systemName: "person.fill"),
                    name: model.name,
                    quote: model.quote,
                    phrase: model.phrase,
                    specie: model.species,
                    gender: model.gender,
                    birthdayDay: model.birthday_day,
                    birthdayMonth: model.birthday_month
                )
                
            }
            
            modelView.collectionItems = villagers
            state = .success
            
        } catch {
            state = .failure
        }
    }
}

struct VillagerModelServer: Decodable {
    let url: String
    let name: String
    let alt_name: String
    let title_color: String
    let text_color: String
    let id: String
    let image_url: String
    let species: String
    let personality: String
    let gender: String
    let birthday_month: String
    let birthday_day: String
    let sign: String
    let quote: String
    let phrase: String
    let prev_phrases: [String]
    let clothing: String
    let islander: Bool
    let debut: String
    let appearances: [String]
    //let nh_details: NHDetailsServer
}

//struct NHDetailsServer: Decodable {
//    let imageUrl: String
//    let photoUrl: String
//    let iconUrl: String
//    let quote: String
//    let subPersonality: String
//    let catchphrase: String
//    let clothing: String
//    let clothingVariation: String
//    let favStyles: [String]
//    let favColors: [String]
//    let hobby: String
//    let houseInteriorUrl: String
//    let houseExteriorUrl: String
//    let houseWallpaper: String
//    let houseFlooring: String
//    let houseMusic: String
//    let houseMusicNote: String
//    let umbrella: String
//    
//    public enum CodingKeys: String, CodingKey {
//        case imageUrl = "image_url"
//        case photoUrl = "photo_url"
//        case iconUrl = "icon_url"
//        case quote = "quote"
//        case subPersonality = "sub-personality"
//        case catchphrase = "catchphrase"
//        case clothing = "clothing"
//        case clothingVariation = "clothing_variation"
//        case favStyles = "fav_styles"
//        case favColors = "fav_colors"
//        case hobby = "hobby"
//        case houseInteriorUrl = "house_interior_url"
//        case houseExteriorUrl = "house_exterior_url"
//        case houseWallpaper = "house_wallpaper"
//        case houseFlooring = "house_flooring"
//        case houseMusic = "house_music"
//        case houseMusicNote = "house_music_note"
//        case umbrella = "umbrella"
//    }
//}


