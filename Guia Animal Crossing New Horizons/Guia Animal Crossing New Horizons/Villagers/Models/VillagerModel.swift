//
//  VillagerModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 21/10/25.
//

import Foundation
import SwiftUI

struct VillagerModel: Identifiable, ACCardModel {
    let id = UUID()
    var image: Image
    var name: String
    var foregroundColor: Color = Color("primaryText")
    var backgroundColor: Color = Color("villagerCard")
    let quote: String
    let phrase: String
    let specie: String
    let gender: String
    let birthdayDay: String
    let birthdayMonth: String
    
    init(
        image: Image,
        name: String,
        quote: String,
        phrase: String,
        specie: String,
        gender: String,
        birthdayDay: String,
        birthdayMonth: String
    ) {
        self.image = image
        self.name = name
        self.quote = quote
        self.phrase = phrase
        self.specie = specie
        self.gender = gender
        self.birthdayDay = birthdayDay
        self.birthdayMonth = birthdayMonth
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
        birthdayMonth: "septiembre"
    )
    static let mock2 = VillagerModel(
        image: Image(systemName: "teddybear.fill"),
        name: "Teddy",
        quote: "¡Hay que sufrir para llegar a donde quieres!",
        phrase: "gruuuf",
        specie: "Oso",
        gender: "Masulino",
        birthdayDay: "26",
        birthdayMonth: "septiembre"
    )
    static let mock3 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Melba",
        quote: "¡El mundo sería horrible si no hubiera abrazos!",
        phrase: "tesoro",
        specie: "Koala",
        gender: "Femenino",
        birthdayDay: "12",
        birthdayMonth: "abril"
    )
    static let mock4 = VillagerModel(
        image: Image(systemName: "teddybear.fill"),
        name: "Celeste",
        quote: "Si no es bonito, me lo quito",
        phrase: "cielito",
        specie: "Osito",
        gender: "Femenino",
        birthdayDay: "24",
        birthdayMonth: "junio"
    )
    static let mock5 = VillagerModel(
        image: Image(systemName: "hare.fill"),
        name: "Ariel",
        quote: "Todo tiene su momento y mi momento ha llegado.",
        phrase: "neutrino",
        specie: "Conejo",
        gender: "Masculino",
        birthdayDay: "19",
        birthdayMonth: "mayo"
    )
    static let mock6 = VillagerModel(
        image: Image(systemName: "dog.fill"),
        name: "Tere",
        quote: "¡Los perros y los gatos pueden ser grandes amigos!",
        phrase: "guau-guau",
        specie: "Perro",
        gender: "Femenino",
        birthdayDay: "27",
        birthdayMonth: "diciembre"
    )
    static let mock7 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Lope",
        quote: "Si asistes a la fiesta, te pierdes la fiesta.",
        phrase: "babum",
        specie: "Ciervo",
        gender: "Masculino",
        birthdayDay: "5",
        birthdayMonth: "abril"
    )
    static let mock8 = VillagerModel(
        image: Image(systemName: "person.fill"),
        name: "Paulino",
        quote: "Las cosas pasan porque tienen que pasar.",
        phrase: "glub-glub",
        specie: "Pulpo",
        gender: "Masculino",
        birthdayDay: "8",
        birthdayMonth: "marzo"
    )
}
