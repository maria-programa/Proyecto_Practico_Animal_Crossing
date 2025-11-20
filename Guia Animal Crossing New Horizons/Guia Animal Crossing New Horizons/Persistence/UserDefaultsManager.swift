//
//  UserDefaultsManager.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/11/25.
//

import Foundation

class UserDefaultsManager {
    let defaults = UserDefaults.standard
    
    func get<T>(
        forKey: UserDefaultKeys,
        type: T.Type
    ) -> T? {
        guard let value = defaults.object(forKey: forKey.rawValue),
              let valueType = value as? T
        else {
            return nil
        }
        
        return valueType
    }
    
    func set(
        value: Any?,
        forKey: UserDefaultKeys
    ) {
        defaults.set(value, forKey: forKey.rawValue)
    }
}

enum UserDefaultKeys: String {
    case theme
    case likedVillagers
    case likedFishes
    case likedBugs
    case likedFossils
}
