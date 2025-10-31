//
//  VillagerDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 30/10/25.
//

import SwiftUI

struct VillagerDetailsView: View {
    let villager: VillagerModel
    
    var body: some View {
        villagerDetailsLayout
    }
    
    var villagerDetailsLayout: some View {
        List {
            viewTitle
                .listRowSeparatorTint(Color("villagerCard"))
            HStack (spacing: 16) {
                villagerPicture
                VStack (alignment: .leading, spacing: 8) {
                    villagerName
                    villagerBirthday
                    villagerSpecie
                }
            }
            villagerQuote
            villagerPhrase
        }
        .background(Color("villagerCard"))
        .scrollContentBackground(.hidden)
    }
    var viewTitle: some View {
        Text("PASSPORT")
            .font(.title)
    }

    var villagerPicture: some View {
        villager.image
            .resizable()
            .scaledToFit()
            .padding()
            .modifier(Encapsulated(color: Color.black))
            .frame(width: 150, height: 150)
    }
    
    var villagerName: some View {
        Text(villager.name)
            .modifier(FontStyle())
    }

    var villagerBirthday: some View {
        Text("\(villager.birthdayDay) de \(villager.birthdayMonth)")
            .modifier(FontStyle())
    }

    var villagerSpecie: some View {
        Text(villager.specie)
            .modifier(FontStyle())
    }

    var villagerQuote: some View {
        Text(villager.quote)
            .modifier(FontStyle())
        
    }

    var villagerPhrase: some View {
        Text("\"\(villager.phrase)\"")
            .modifier(FontStyle())
        
    }
}

struct Encapsulated: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(color, lineWidth: 8))
    }
}

struct FontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
    }
}

#Preview {
    VillagerDetailsView(villager: VillagerModel.mock1)
}
