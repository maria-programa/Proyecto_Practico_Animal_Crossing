//
//  FavouritesStore.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 21/1/26.
//

import Foundation
import Combine

final class FavouritesStore: ObservableObject {
    static let shared = FavouritesStore()
    
    @Published private(set) var villagers: [String: VillagerModel] = [:]
    
    init(){}
    
    func addVillager(_ villager: VillagerModel) {
        villagers[villager.villagerID] = villager
    }
    
    func deleteVillager(id: String) {
        villagers.removeValue(forKey: id)
    }
}
