//
//  FossilsViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 14/11/25.
//

import Foundation
import SwiftUI
import Combine

class FossilsViewModel: BaseViewModel {
    @Published var modelView: FossilsModelView
    @Published var state: ViewModelState = .initial
    let api = APICall()
    let userDefaultManager = UserDefaultsManager()
    let favouritesStore = FavouritesStore.shared
    
    init(
        modelView: FossilsModelView = FossilsModelView()
    ) {
        self.modelView = modelView
    }
    
    func onAppear() async {
        if modelView.collectionItems.isEmpty {
            await loadFossils()
        }
    }
    
    func handleLikedItem(_ model: FossilModel) {
        guard let modelIndex = modelView.collectionItems.firstIndex(of: model)
        else {
            return
        }
        
        if model.isLiked {
            userDefaultManager.deleteItems(model.name, .likedFossils)
            favouritesStore.deleteFossil(id: model.name)
        } else {
            userDefaultManager.saveItems(model.name, .likedFossils)
            favouritesStore.addFossil(model)
        }
        modelView.collectionItems[modelIndex].isLiked.toggle()
    }
    
    private func loadFossils() async {
        do {
            state = .initial
            
            let decodedData = try await api.request(
                endpoint: "nh/fossils/individuals",
                method: .get,
                modelServer: Array<FossilModelServer>.self
            )
            
            let fossils = decodedData.compactMap { model in
            let fossil = FossilModel (
                    imageURL: URL(string: model.imageURL),
                    name: model.name,
                    fossilGroup: model.fossilGroup,
                    sellingPrice: model.sell,
                    interactable: model.interactable,
                    isLiked: userDefaultManager.checkIfItemIsLiked(model.name, .likedFossils)
                )
                if fossil.isLiked {
                    favouritesStore.addFossil(fossil)
                }
                
                return fossil
            }
            modelView.collectionItems = fossils
            state = .success
        } catch {
            modelView.errorDescription = error.localizedDescription
            state = .failure
        }
    }
}

struct FossilModelServer: Decodable {
    let name: String
    let url: String
    let imageURL: String
    let fossilGroup: String
    let interactable: Bool
    let sell: Int
    let hhaBase: Int
    let width: Float
    let length: Float
    let colors: [String]
    
    public enum CodingKeys: String, CodingKey {
        case name
        case url
        case imageURL = "image_url"
        case fossilGroup = "fossil_group"
        case interactable
        case sell
        case hhaBase = "hha_base"
        case width
        case length
        case colors
    }
}
