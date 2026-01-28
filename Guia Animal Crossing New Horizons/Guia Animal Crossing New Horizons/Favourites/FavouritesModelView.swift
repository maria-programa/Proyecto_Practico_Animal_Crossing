//
//  FavouritesModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/12/25.
//

import Foundation

struct FavouritesModelView: BaseModelView {
    let screenTitle: String = "Favoritos"
    var likedVillagers: [String] = []
    var likedFishes: [String] = []
    var likedBugs: [String] = []
    var likedFossils: [String] = []
    
    var favouritesIsEmpty: Bool {
        likedVillagers.isEmpty && likedFishes.isEmpty && likedBugs.isEmpty && likedFossils.isEmpty
    }
}
