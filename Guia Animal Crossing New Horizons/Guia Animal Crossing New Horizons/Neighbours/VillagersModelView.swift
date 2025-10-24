//
//  VillagersModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation

struct VillagersModelView: ACCollectionTemplateModel {
    let screenTitle: String = "Vecinos"
    let description: String = "En la siguiente lista puedes ver los vecinos de tu isla!\nApresurate a conocerl@s a tod@s.\n\nRecuerda que puedes regalar items a tus vecinos para mejorar tu relacion."
    let collectionItems: [VillagerModel] = [.mock1, .mock2, .mock3, .mock4, .mock5, .mock6, .mock7, .mock8]
    
    init(){}
}
