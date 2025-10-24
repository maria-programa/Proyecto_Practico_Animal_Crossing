//
//  FishModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation
import SwiftUI

struct FishModel: Identifiable, ACCardModel {
    let id = UUID()
    let specie: String
    let fishIcon: Image = Image(systemName:"fish.fill")
    let foregroundColor: Color = .white
    let backgroundColor: Color = .cyan
    
    //Estas variables son para poder conformar el protocolo de ACCardmodel, ya que ahí las variables se llaman image y name. Lo hacemos así porque cuando recuperemos los datos de la API, por ejemplo, no sabemos que nombre le habrán dado a cada cosa y esto es el apaño que se hace
    var image: Image {
        return fishIcon
    }
    
    var name: String {
        return specie
    }
    
    init(specie: String) {
        self.specie = specie
    }
}

extension FishModel {
    static let mock1 = FishModel(specie: "Tuna")
    static let mock2 = FishModel(specie: "Salmon")
    static let mock3 = FishModel(specie: "Tilapia")
    static let mock4 = FishModel(specie: "Cod")
    static let mock5 = FishModel(specie: "Meckerel")
    static let mock6 = FishModel(specie: "Trout")
    static let mock7 = FishModel(specie: "Lobster")
    static let mock8 = FishModel(specie: "Shark")
}
