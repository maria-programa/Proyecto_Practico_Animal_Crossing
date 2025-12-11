//
//  BugModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import Foundation
import SwiftUI

struct BugModel: Identifiable, ACCardModel, ACDetailsModel, BaseModelView {

    let id = UUID()
    let specie: String
    let bugIcon: Image = Image(systemName: "ladybug.fill")
    let foregroundColor: Color = Color("primaryText")
    let backgroundColor: Color = .green
    var isLiked: Bool
    
    let action: String = "caza"
    let info: String = "Clima: "
    let buyer: String = "Kamilo: "
    let catchPhrase: String
    let location: String
    let time: String
    let weather: String
    let abailabilityNorth: String
    let abailabilitySouth: String
    let sellingPriceNook: Int
    let sellingPriceKamilo: Int
    
    var imageURL: URL?
    var renderImageURL: URL?
    var defaultImage: Image {
        return bugIcon
    }
    
    var name: String {
        return specie
    }
    
    var importantInfo: String {
        return weather
    }
    
    var sellingPriceOther: Int {
        return sellingPriceKamilo
    }
    
    init(
        specie: String,
        catchPhrase: String,
        location: String,
        time: String,
        weather: String,
        abailabilityNorth: String,
        abailabilitySouth: String,
        sellingPriceNook: Int,
        sellingPriceKamilo: Int,
        imageURL: URL? = nil, // TODO: quitar valor por defecto
        renderImageURL: URL? = nil, //TODO: quitar el valor por defecto
        isLiked: Bool
    ) {
        self.specie = specie
        self.catchPhrase = catchPhrase
        self.location = location
        self.time = time
        self.weather = weather
        self.abailabilityNorth = abailabilityNorth
        self.abailabilitySouth = abailabilitySouth
        self.sellingPriceNook = sellingPriceNook
        self.sellingPriceKamilo = sellingPriceKamilo
        self.imageURL = imageURL
        self.renderImageURL = renderImageURL
        self.isLiked = isLiked
    }
}

extension BugModel: Hashable {
    // Custom Hashable: hash id only
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension BugModel {
    static let mock1 = BugModel(
        specie: "Grasshopper",
        catchPhrase: "I caught a grasshopper! They're a grass act!",
        location: "On the ground",
        time: "8 AM – 5 PM",
        weather: "Any except rain",
        abailabilityNorth: "Jul – Sep",
        abailabilitySouth: "Jan – Mar",
        sellingPriceNook: 160,
        sellingPriceKamilo: 240,
        isLiked: false
    )
    static let mock2 = BugModel(
        specie: "Ant",
        catchPhrase: "I caught an ant! TELL ME WHERE THE QUEEN IS!",
        location: "On/near spoiled turnips/candy/lollipops",
        time: "All day",
        weather: "Any weather",
        abailabilityNorth: "All year",
        abailabilitySouth: "All year",
        sellingPriceNook: 80,
        sellingPriceKamilo: 120,
        isLiked: false
    )
    static let mock3 = BugModel(
        specie: "Ladybug",
        catchPhrase: "I caught a ladybug! Sorry to disturb you, ma'am.",
        location: "On flowers",
        time: "8 AM – 5 PM",
        weather: "Any except rain",
        abailabilityNorth: "Mar – Jun; Oct",
        abailabilitySouth: "Apr; Sep – Dec",
        sellingPriceNook: 200,
        sellingPriceKamilo: 300,
        isLiked: false
    )
    static let mock4 = BugModel(
        specie: "Monarch Butterfly",
        catchPhrase: "I caught a monarch butterfly! Guess the butterflies are a democracy now!",
        location: "Flying near flowers",
        time: "4 AM – 5 PM",
        weather: "Any except rain",
        abailabilityNorth: "Sep – Nov",
        abailabilitySouth: "Mar – May",
        sellingPriceNook: 140,
        sellingPriceKamilo: 210,
        isLiked: false
    )
    static let mock5 = BugModel(
        specie: "Mosquito",
        catchPhrase: "I caught a mosquito! It's itching for a fight!",
        location: "Flying",
        time: "5 PM – 4 AM",
        weather: "Any except rain",
        abailabilityNorth: "Jun – Sep",
        abailabilitySouth: "Dec – Mar",
        sellingPriceNook: 130,
        sellingPriceKamilo: 195,
        isLiked: false
    )
}
