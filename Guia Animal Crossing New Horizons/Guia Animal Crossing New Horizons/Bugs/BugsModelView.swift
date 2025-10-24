//
//  BugsModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation

struct BugsModelView: ACCollectionTemplateModel {
    let screenTitle: String = "Bichos"
    let description: String = "Descubre a los bichos que puedes encontrar en tu isla. Captúralos y dónalos al museo, regálaselo a tu vecino favorito, véndelos o decora tu isla con ellos."
    let collectionItems: [BugModel] = [.mock1, .mock2, .mock3, .mock4, .mock5]
}
