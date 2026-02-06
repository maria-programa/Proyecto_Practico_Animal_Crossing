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
    let api = APICall()
    let userDefaultManager = UserDefaultsManager()
    let favouritesStore = FavouritesStore.shared
    
    init(modelView: VillagersModelView = VillagersModelView()) {
        self.modelView = modelView
    }
    
    func onAppear() async {
        if modelView.collectionItems.isEmpty {
            await loadVillagers()
        }
    }
    
    func handleLikedItem(_ model: VillagerModel) {
        guard let modelIndex = modelView.collectionItems.firstIndex(of: model)
        else {
            return
        }
        
        if model.isLiked {
            userDefaultManager.deleteItems(model.villagerID, .likedVillagers)
            favouritesStore.deleteVillager(id: model.villagerID)
        } else {
            userDefaultManager.saveItems(model.villagerID, .likedVillagers)
            favouritesStore.addVillager(model)

        }
        modelView.collectionItems[modelIndex].isLiked.toggle()
    }
    
    private func loadVillagers() async {
        do {
            state = .loading
            
            let decodedData = try await api.request(
//                endpoint: "villagers",
                endpoint: "villagers?nhdetails=true",
                method: .get,
                modelServer: Array<VillagerModelServer>.self
            )
        
            let villagers = decodedData.compactMap { model in
            let villager = VillagerModel(
                    villagerID: model.id,
                    image: Image(systemName: "person.fill"),
                    name: model.name,
                    quote: model.quote,
                    phrase: model.phrase,
                    specie: model.species,
                    gender: model.gender,
                    birthdayDay: model.birthday_day,
                    birthdayMonth: model.birthday_month,
                    imageURL: URL(string: model.image_url),
                    iconURL: URL(string: model.nh_details?.iconUrl ?? ""),
                    isLiked: userDefaultManager.checkIfItemIsLiked(model.id, .likedVillagers)
                )
                
                if villager.isLiked {
                    favouritesStore.addVillager(villager)
                }
                
                return villager
            }
            
            modelView.collectionItems = villagers
            state = .success
            
        } catch {
            modelView.errorDescription = error.localizedDescription
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
    let nh_details: NHDetailsServer?
}

struct NHDetailsServer: Decodable {
    let imageUrl: String
    let photoUrl: String
    let iconUrl: String
    let quote: String
    let subPersonality: String
    let catchphrase: String
    let clothing: String
    let clothingVariation: String
    let favStyles: [String]
    let favColors: [String]
    let hobby: String
    let houseInteriorUrl: String
    let houseExteriorUrl: String
    let houseWallpaper: String
    let houseFlooring: String
    let houseMusic: String
    let houseMusicNote: String
    let umbrella: String
    
    public enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case photoUrl = "photo_url"
        case iconUrl = "icon_url"
        case quote
        case subPersonality = "sub-personality"
        case catchphrase
        case clothing
        case clothingVariation = "clothing_variation"
        case favStyles = "fav_styles"
        case favColors = "fav_colors"
        case hobby
        case houseInteriorUrl = "house_interior_url"
        case houseExteriorUrl = "house_exterior_url"
        case houseWallpaper = "house_wallpaper"
        case houseFlooring = "house_flooring"
        case houseMusic = "house_music"
        case houseMusicNote = "house_music_note"
        case umbrella
    }
}


