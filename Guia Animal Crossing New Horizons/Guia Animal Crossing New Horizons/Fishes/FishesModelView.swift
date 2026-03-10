//
//  FishesModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation

struct FishesModelView: BaseModelView, ACCollectionTemplateModel {
    let screenTitle: String = "Peces"
    let description: String = "En la siguiente lista puedes ver los peces que has capturado! Puedes donarlos al museo, regalarselos a algún vecino o incluso cocinarlos\n\n¡Saca tu caña y explora las costas!"
    var collectionItems: [FishModel] = []
    var errorDescription: String = "Algo ha fallado"
    
    var allFishes: [FishModel] = []
    var filteredFishes: [FishModel] = []
    
    init(){}
}
