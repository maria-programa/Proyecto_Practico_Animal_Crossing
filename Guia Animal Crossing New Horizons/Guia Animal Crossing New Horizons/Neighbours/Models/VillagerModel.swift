//
//  VillagerModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 21/10/25.
//

import Foundation
import SwiftUI

struct VillagerModel: Identifiable, ACCardModel {
    let id = UUID()
    var image: Image
    var name: String
    var foregroundColor: Color = Color("primaryText")
    var backgroundColor: Color = Color("villagerCard")
    
    init(
        image: Image,
        name: String
    ) {
        self.image = image
        self.name = name
    }
}

extension VillagerModel {
    static let mock1 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Munchi"
    )
    static let mock2 = VillagerModel(
        image: Image(systemName: "teddybear.fill"),
        name: "Teddy"
    )
    static let mock3 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Melba"
    )
    static let mock4 = VillagerModel(
        image: Image(systemName: "teddybear.fill"),
        name: "Celeste"
    )
    static let mock5 = VillagerModel(
        image: Image(systemName: "hare.fill"),
        name: "Ariel"
    )
    static let mock6 = VillagerModel(
        image: Image(systemName: "dog.fill"),
        name: "Tere"
    )
    static let mock7 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Lope"
    )
    static let mock8 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Paulino"
    )
}
