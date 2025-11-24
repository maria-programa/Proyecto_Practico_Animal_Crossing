//
//  UD+Collections.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 21/11/25.
//

import Foundation

extension UserDefaultsManager {
    func getItems(_ forKey: UserDefaultKeys) -> [String] {
        guard let savedIDs = self.get(forKey: forKey, type: Array<String>.self)
        else {
            return []
        }
        return savedIDs
    }
    
    func setItems(_ ids: [String], _ forKey: UserDefaultKeys) {
        self.set(value: ids, forKey: forKey)
    }
    
    func deleteItems(_ id: String, _ forKey: UserDefaultKeys) {
        let savedIDs = getItems(forKey)
        guard !savedIDs.isEmpty,
              let index = savedIDs.firstIndex(of: id)
        else {
            return
        }
        var updatedIDs = savedIDs
        updatedIDs.remove(at: index)
        setItems(updatedIDs, forKey)
    }
    
    func saveItems(_ id: String, _ forKey: UserDefaultKeys) {
        let savedIDs = getItems(forKey)
        if savedIDs.isEmpty {
            setItems([id], forKey)
        } else {
            var updatedIds = savedIDs
            updatedIds.append(id)
            setItems(updatedIds, forKey)
        }
    }
    
    func checkIfItemIsLiked(_ id: String, _ forKey: UserDefaultKeys) -> Bool {
        let savedIDs = getItems(forKey)
        guard !savedIDs.isEmpty
        else {
            return false
        }
        return savedIDs.contains(id)
    }
}
