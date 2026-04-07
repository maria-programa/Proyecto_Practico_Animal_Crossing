//
//  VillagersModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation

struct VillagersModelView: BaseModelView, ACCollectionTemplateModel {
    let screenTitle: String = "Vecinos"
    let description: String = "En la siguiente lista puedes ver los vecinos de tu isla!\nApresurate a conocerl@s a tod@s.\n\nRecuerda que puedes regalar items a tus vecinos para mejorar tu relacion."
    var collectionItems: [VillagerModel] = []
    var errorDescription: String = "Algo ha fallado"
    
    var filteredVillagers: [VillagerModel] = []
    
    init(){}
}
