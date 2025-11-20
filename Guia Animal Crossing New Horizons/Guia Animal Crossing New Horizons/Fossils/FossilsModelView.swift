//
//  FossilsModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 14/11/25.
//

import Foundation

struct FossilsModelView: BaseModelView, ACCollectionTemplateModel {
    let screenTitle: String = "Fósiles"
    let description: String = "En esta lista podrás encontrar los diferentes fósiles que puedes encontrar en tu isla. Lánzate a la aventura y explora tu isla en busca de todos ellos.\n\n¡Haz a Sócrates un búho muy feliz donándolos al museo!"
    var collectionItems: [FossilModel] = []
    var errorDescription: String = "Algo ha salido mal"
}
