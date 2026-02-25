//
//  FishModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation
import SwiftUI

struct FishModel: Identifiable, ACCardModel, ACDetailsModel, BaseModelView {
        
    let id = UUID()
    let specie: String
    let fishIcon: Image = Image(systemName:"fish")
    let foregroundColor: Color = .white
    let backgroundColor: Color = .cyan
    var isLiked: Bool
    
    let action: String = "pesca"
    let info: String = "Sombra: "
    let buyer: String = "CJ: "
    let catchPhrase: String
    let location: String
    let time: String
    let shadowSize: String
    let rarity: String
    let abailabilityNorth: String
    let abailabilitySouth: String
    let sellingPriceNook: Int
    let sellingPriceCJ: Int
    
    var imageURL: URL?
    var renderImageURL: URL?
    var defaultImage: Image {
        return fishIcon
    }
    
    var name: String {
        return specie
    }
    
    var importantInfo: String {
        return shadowSize
    }
    
    var sellingPriceOther: Int {
        return sellingPriceCJ
    }
    
    init(
        specie: String,
        catchPhrase: String,
        location: String,
        time: String,
        shadowSize: String,
        rarity: String,
        abailabilityNorth: String,
        abailabilitySouth: String,
        sellingPriceNook: Int,
        sellingPriceCJ: Int,
        imageURL: URL? = nil, // TODO: quitar valor por defecto
        renderImageURL: URL? = nil, //TODO: quitar el valor por defecto
        isLiked: Bool
    ) {
        self.specie = specie
        self.catchPhrase = catchPhrase
        self.location = location
        self.time = time
        self.shadowSize = shadowSize
        self.rarity = rarity
        self.abailabilityNorth = abailabilityNorth
        self.abailabilitySouth = abailabilitySouth
        self.sellingPriceNook = sellingPriceNook
        self.sellingPriceCJ = sellingPriceCJ
        self.imageURL = imageURL
        self.renderImageURL = renderImageURL
        self.isLiked = isLiked
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
        rarity: "Common",
        abailabilityNorth: "Nov - Apr",
        abailabilitySouth: "May - Nov",
        sellingPriceNook: 7000,
        sellingPriceCJ: 10500,
        isLiked: false
    )
    static let mock2 = FishModel(
        specie: "Salmon",
        catchPhrase: "I caught a salmon! It's all upstream from here!",
        location: "River (mouth)",
        time: "All day",
        shadowSize: "Large",
        rarity: "Common",
        abailabilityNorth: "Sep",
        abailabilitySouth: "Mar",
        sellingPriceNook: 700,
        sellingPriceCJ: 1050,
        isLiked: false
    )
    static let mock3 = FishModel(
        specie: "Tilapia",
        catchPhrase: "I caught a tilapia! It makes me happy-a!",
        location: "River",
        time: "All day",
        shadowSize: "Medium",
        rarity: "Common",
        abailabilityNorth: "Jun - Oct",
        abailabilitySouth: "Dec - Apr",
        sellingPriceNook: 800,
        sellingPriceCJ: 1200,
        isLiked: false
    )
    static let mock4 = FishModel(
        specie: "Koi",
        catchPhrase: "I caught a koi! I don't know why it's so shy... or such a bad speller...",
        location: "Pond",
        time: "4 PM - 9 AM",
        shadowSize: "Large",
        rarity: "Common",
        abailabilityNorth: "All year",
        abailabilitySouth: "All year",
        sellingPriceNook: 4000,
        sellingPriceCJ: 6000,
        isLiked: false
    )
    static let mock5 = FishModel(
        specie: "Horse mackerel",
        catchPhrase: "I caught a horse mackerel! Of course, mack...er...el.",
        location: "Sea",
        time: "All day",
        shadowSize: "Small",
        rarity: "Common",
        abailabilityNorth: "All year",
        abailabilitySouth: "All year",
        sellingPriceNook: 150,
        sellingPriceCJ: 225,
        isLiked: false
    )
    static let mock6 = FishModel(
        specie: "Golden trout",
        catchPhrase: "I caught a golden trout! But the real treasure? Friendship.",
        location: "River (clifftop)",
        time: "4 PM - 9 AM",
        shadowSize: "Medium",
        rarity: "Common",
        abailabilityNorth: "Mar - May; Sep - Nov",
        abailabilitySouth: "Mar - May; Sep - Nov",
        sellingPriceNook: 15000,
        sellingPriceCJ: 22500,
        isLiked: false
    )
    static let mock7 = FishModel(
        specie: "Crawfish",
        catchPhrase: "I caught a crawfish! Or else it's a lobster, and I'm a giant!",
        location: "Pond",
        time: "All day",
        shadowSize: "Small",
        rarity: "Common",
        abailabilityNorth: "Apr - Sep",
        abailabilitySouth: "Oct - Mar",
        sellingPriceNook: 200,
        sellingPriceCJ: 300,
        isLiked: false
    )
    static let mock8 = FishModel(
        specie: "Shark",
        catchPhrase: "I caught a great white shark! Watch out for its jaws!",
        location: "Sea",
        time: "4 PM – 9 AM",
        shadowSize: "Very large (finned)",
        rarity: "Common",
        abailabilityNorth: "Jun – Sep",
        abailabilitySouth: "Dec – Mar",
        sellingPriceNook: 15000,
        sellingPriceCJ: 22500,
        isLiked: false
    )
}
