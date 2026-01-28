//
//  FavouritesViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/12/25.
//

import Foundation
import Combine

class FavouritesViewModel: BaseViewModel {
    @Published var modelView: FavouritesModelView
    @Published var state: ViewModelState
    let userDefaultManager = UserDefaultsManager()
    let favouritesStore = FavouritesStore.shared
    
    init(
        modelView: FavouritesModelView = FavouritesModelView(),
        state: ViewModelState = .initial
    ) {
        self.modelView = modelView
        self.state = state
    }
    
    func loadLikedItems() {
        modelView.likedVillagers = userDefaultManager.getItems(.likedVillagers)
        modelView.likedFishes = userDefaultManager.getItems(.likedFishes)
        modelView.likedBugs = userDefaultManager.getItems(.likedBugs)
        modelView.likedFossils = userDefaultManager.getItems(.likedFossils)
    }
}
