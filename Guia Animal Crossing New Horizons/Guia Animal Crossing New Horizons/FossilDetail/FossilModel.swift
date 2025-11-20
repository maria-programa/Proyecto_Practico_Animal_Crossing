//
//  FossilModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 14/11/25.
//

import Foundation
import SwiftUI

struct FossilModel: Identifiable, BaseModelView, ACCardModel {
    let id = UUID()
    var imageURL: URL?
    let defaultImage: Image = Image(systemName: "fossil.shell.fill")
    var name: String
    var foregroundColor: Color = Color("primaryText")
    var backgroundColor: Color = Color("fossilCard")
    var isLiked: Bool
    
    let fossilGroup: String
    let sellingPrice: Int
    let interactable: Bool
    
    init(
        imageURL: URL? = nil,
        name: String,
        fossilGroup: String,
        sellingPrice: Int,
        interactable: Bool,
        isLiked: Bool
    ) {
        self.imageURL = imageURL
        self.name = name
        self.fossilGroup = fossilGroup
        self.sellingPrice = sellingPrice
        self.interactable = interactable
        self.isLiked = isLiked
    }
}

extension FossilModel: Hashable {
    // Custom Hashable: hash id only
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension FossilModel {
    static let mock1 = FossilModel(
        name: "Spino skull",
        fossilGroup: "Spinosaurus",
        sellingPrice: 4000,
        interactable: true,
        isLiked: false
    )
    
    static let mock2 = FossilModel(
        name: "Spino torso",
        fossilGroup: "Spinosaurus",
        sellingPrice: 3000,
        interactable: false,
        isLiked: false
    )
    
    static let mock3 = FossilModel(
        name: "Spino tail",
        fossilGroup: "Spinosaurus",
        sellingPrice: 2500,
        interactable: false,
        isLiked: false
    )
    
    static let mock4 = FossilModel(
        name: "T. rex skull",
        fossilGroup: "T. rex",
        sellingPrice: 6000,
        interactable: true,
        isLiked: false
    )
    
    static let mock5 = FossilModel(
        name: "T. rex torso",
        fossilGroup: "T. rex",
        sellingPrice: 5500,
        interactable: false,
        isLiked: false
    )
    
    static let mock6 = FossilModel(
        name: "T. rex tail",
        fossilGroup: "T. rex",
        sellingPrice: 5000,
        interactable: false,
        isLiked: false
    )
    
    static let mock7 = FossilModel(
        name: "Acanthostega",
        fossilGroup: "",
        sellingPrice: 2000,
        interactable: false,
        isLiked: false
    )
    
    static let mock8 = FossilModel(
        name: "Trilobite",
        fossilGroup: "",
        sellingPrice: 1300,
        interactable: false,
        isLiked: false
    )
}
