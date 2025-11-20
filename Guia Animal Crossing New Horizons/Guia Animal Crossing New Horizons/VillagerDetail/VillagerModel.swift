//
//  VillagerModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 21/10/25.
//

import Foundation
import SwiftUI

struct VillagerModel: Identifiable, ACCardModel, BaseModelView {
    let id = UUID()
    var defaultImage: Image
    var name: String
    var foregroundColor: Color = Color("primaryText")
    var backgroundColor: Color = Color("villagerCard")
    var isLiked: Bool
    
    let quote: String
    let phrase: String
    let specie: String
    let gender: String
    let birthdayDay: String
    let birthdayMonth: String
    var imageURL: URL?
    
    init(
        image: Image,
        name: String,
        quote: String,
        phrase: String,
        specie: String,
        gender: String,
        birthdayDay: String,
        birthdayMonth: String,
        imageURL: URL? = nil, // TODO: quitar valor por defecto
        isLiked: Bool
    ) {
        self.defaultImage = image
        self.name = name
        self.quote = quote
        self.phrase = phrase
        self.specie = specie
        self.gender = gender
        self.birthdayDay = birthdayDay
        self.birthdayMonth = birthdayMonth
        self.imageURL = imageURL
        self.isLiked = isLiked
    }
}

extension VillagerModel: Hashable {
    // Custom Hashable: hash id only
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension VillagerModel {
    static let mock1 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Munchi",
        quote: "Vive cada día como si fuera irrepetible",
        phrase: "tecuén",
        specie: "Ardilla",
        gender: "Masculino",
        birthdayDay: "29",
        birthdayMonth: "septiembre",
        isLiked: false
    )
    static let mock2 = VillagerModel(
        image: Image(systemName: "teddybear.fill"),
        name: "Teddy",
        quote: "¡Hay que sufrir para llegar a donde quieres!",
        phrase: "gruuuf",
        specie: "Oso",
        gender: "Masulino",
        birthdayDay: "26",
        birthdayMonth: "septiembre",
        isLiked: false
    )
    static let mock3 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Melba",
        quote: "¡El mundo sería horrible si no hubiera abrazos!",
        phrase: "tesoro",
        specie: "Koala",
        gender: "Femenino",
        birthdayDay: "12",
        birthdayMonth: "abril",
        isLiked: false
    )
    static let mock4 = VillagerModel(
        image: Image(systemName: "teddybear.fill"),
        name: "Celeste",
        quote: "Si no es bonito, me lo quito",
        phrase: "cielito",
        specie: "Osito",
        gender: "Femenino",
        birthdayDay: "24",
        birthdayMonth: "junio",
        isLiked: false
    )
    static let mock5 = VillagerModel(
        image: Image(systemName: "hare.fill"),
        name: "Ariel",
        quote: "Todo tiene su momento y mi momento ha llegado.",
        phrase: "neutrino",
        specie: "Conejo",
        gender: "Masculino",
        birthdayDay: "19",
        birthdayMonth: "mayo",
        isLiked: false
    )
    static let mock6 = VillagerModel(
        image: Image(systemName: "dog.fill"),
        name: "Tere",
        quote: "¡Los perros y los gatos pueden ser grandes amigos!",
        phrase: "guau-guau",
        specie: "Perro",
        gender: "Femenino",
        birthdayDay: "27",
        birthdayMonth: "diciembre",
        isLiked: false
    )
    static let mock7 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Lope",
        quote: "Si asistes a la fiesta, te pierdes la fiesta.",
        phrase: "babum",
        specie: "Ciervo",
        gender: "Masculino",
        birthdayDay: "5",
        birthdayMonth: "abril",
        isLiked: false
    )
    static let mock8 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Paulino",
        quote: "Las cosas pasan porque tienen que pasar.",
        phrase: "glub-glub",
        specie: "Pulpo",
        gender: "Masculino",
        birthdayDay: "8",
        birthdayMonth: "marzo",
        isLiked: false
    )
}
