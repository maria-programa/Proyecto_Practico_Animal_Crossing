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
    let fishIcon: Image = Image(systemName:"fish")
    let foregroundColor: Color = .white
    let backgroundColor: Color = .cyan
    
    //Estas variables son para poder conformar el protocolo de ACCardmodel, ya que ahí las variables se llaman image y name. Lo hacemos así porque cuando recuperemos los datos de la API, por ejemplo, no sabemos que nombre le habrán dado a cada cosa y esto es el apaño que se hace
    var image: Image {
        return fishIcon
    }
    
    var name: String {
        return specie
    }
    
    let catchPhrase: String
    let location: String
    let time: String
    let shadowSize: String
    let abailabilityNorth: String
    let abailabilitySouth: String
    let sellingPriceNook: Int
    let sellingPriceCJ: Int
    
    init(
        specie: String,
        catchPhrase: String,
        location: String,
        time: String,
        shadowSize: String,
        abailabilityNorth: String,
        abailabilitySouth: String,
        sellingPriceNook: Int,
        sellingPriceCJ: Int
    ) {
        self.specie = specie
        self.catchPhrase = catchPhrase
        self.location = location
        self.time = time
        self.shadowSize = shadowSize
        self.abailabilityNorth = abailabilityNorth
        self.abailabilitySouth = abailabilitySouth
        self.sellingPriceNook = sellingPriceNook
        self.sellingPriceCJ = sellingPriceCJ
    }
}

extension FishModel: Hashable {
    // Custom Hashable: hash id only
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension FishModel {
    static let mock1 = FishModel(
        specie: "Tuna",
        catchPhrase: "I caught a tuna! It's a little off-key!",
        location: "Pier",
        time: "All day",
        shadowSize: "Huge",
        abailabilityNorth: "Nov - Apr",
        abailabilitySouth: "May - Nov",
        sellingPriceNook: 7000,
        sellingPriceCJ: 10500
    )
    static let mock2 = FishModel(
        specie: "Salmon",
        catchPhrase: "I caught a salmon! It's all upstream from here!",
        location: "River (mouth)",
        time: "All day",
        shadowSize: "Large",
        abailabilityNorth: "Sep",
        abailabilitySouth: "Mar",
        sellingPriceNook: 700,
        sellingPriceCJ: 1050
    )
    static let mock3 = FishModel(
        specie: "Tilapia",
        catchPhrase: "I caught a tilapia! It makes me happy-a!",
        location: "River",
        time: "All day",
        shadowSize: "Medium",
        abailabilityNorth: "Jun - Oct",
        abailabilitySouth: "Dec - Apr",
        sellingPriceNook: 800,
        sellingPriceCJ: 1200
    )
    static let mock4 = FishModel(
        specie: "Koi",
        catchPhrase: "I caught a koi! I don't know why it's so shy... or such a bad speller...",
        location: "Pond",
        time: "4 PM - 9 AM",
        shadowSize: "Large",
        abailabilityNorth: "All year",
        abailabilitySouth: "All year",
        sellingPriceNook: 4000,
        sellingPriceCJ: 6000
    )
    static let mock5 = FishModel(
        specie: "Horse mackerel",
        catchPhrase: "I caught a horse mackerel! Of course, mack...er...el.",
        location: "Sea",
        time: "All day",
        shadowSize: "Small",
        abailabilityNorth: "All year",
        abailabilitySouth: "All year",
        sellingPriceNook: 150,
        sellingPriceCJ: 225
    )
    static let mock6 = FishModel(
        specie: "Golden trout",
        catchPhrase: "I caught a golden trout! But the real treasure? Friendship.",
        location: "River (clifftop)",
        time: "4 PM - 9 AM",
        shadowSize: "Medium",
        abailabilityNorth: "Mar - May; Sep - Nov",
        abailabilitySouth: "Mar - May; Sep - Nov",
        sellingPriceNook: 15000,
        sellingPriceCJ: 22500
    )
    static let mock7 = FishModel(
        specie: "Crawfish",
        catchPhrase: "I caught a crawfish! Or else it's a lobster, and I'm a giant!",
        location: "Pond",
        time: "All day",
        shadowSize: "Small",
        abailabilityNorth: "Apr - Sep",
        abailabilitySouth: "Oct - Mar",
        sellingPriceNook: 200,
        sellingPriceCJ: 300
    )
    static let mock8 = FishModel(
        specie: "Shark",
        catchPhrase: "I caught a great white shark! Watch out for its jaws!",
        location: "Sea",
        time: "4 PM – 9 AM",
        shadowSize: "Very large (finned)",
        abailabilityNorth: "Jun – Sep",
        abailabilitySouth: "Dec – Mar",
        sellingPriceNook: 15000,
        sellingPriceCJ: 22500
    )
}
