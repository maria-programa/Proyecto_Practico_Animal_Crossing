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
    @Published private(set) var fishes: [String: FishModel] = [:]
    @Published private(set) var bugs: [String: BugModel] = [:]
    @Published private(set) var fossils: [String: FossilModel] = [:]
    
    init(){}
    
    func addVillager(_ villager: VillagerModel) {
        villagers[villager.villagerID] = villager
    }
    
    func deleteVillager(id: String) {
        villagers.removeValue(forKey: id)
    }
    
    func addFish(_ fish: FishModel) {
        fishes[fish.specie] = fish
    }
    
    func deleteFish(id: String) {
        fishes.removeValue(forKey: id)
    }
    
    func addBug(_ bug: BugModel) {
        bugs[bug.specie] = bug
    }
    
    func deleteBug(id: String) {
        bugs.removeValue(forKey: id)
    }
    
    func addFossil(_ fossil: FossilModel) {
        fossils[fossil.name] = fossil
    }
    
    func deleteFossil(id: String) {
        fossils.removeValue(forKey: id)
    }
}
