//
//  FishesModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation

struct FishesModelView: ACCollectionTemplateModel {
    let screenTitle: String = "Peces"
    let description: String = "En la siguiente lista puedes ver los peces que has capturado!Puedes donarlos al museo, regalarselos a algún vecino o incluso cocinarlos\n\n¡Saca tu caña y explora las costas!"
    let collectionItems: [FishModel] = [.mock1, .mock2, .mock3, .mock4, .mock5, .mock6, .mock7, .mock8]
    
    init(){}
}
