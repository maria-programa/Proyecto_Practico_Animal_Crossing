//
//  BugModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation
import SwiftUI

struct BugModel:Identifiable, ACCardModel {
    let id = UUID()
    let specie: String
    let bugIcon: Image = Image(systemName: "ladybug.fill")
    let foregroundColor: Color = Color("primaryText")
    let backgroundColor: Color = .green
    
    var image: Image {
        return bugIcon
    }
    
    var name: String {
        return specie
    }
    
    init(specie: String) {
        self.specie = specie
    }
}

extension BugModel {
    static let mock1 = BugModel(specie: "Grasshopper")
    static let mock2 = BugModel(specie: "Ant")
    static let mock3 = BugModel(specie: "Ladybug")
    static let mock4 = BugModel(specie: "Monarch Butterfly")
    static let mock5 = BugModel(specie: "Mosquito")
}
