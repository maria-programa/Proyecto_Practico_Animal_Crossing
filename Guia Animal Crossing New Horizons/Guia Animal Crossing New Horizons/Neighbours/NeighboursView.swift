//
//  NeighboursView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/10/25.
//

import SwiftUI

struct NeighboursView: View {
    let villagers = ["Munchi", "Teddy", "Melba", "Celeste", "Ariel", "Tere", "Lope", "Paulino"]
    
    let column: GridItem = GridItem(.fixed(150))
    let screenTitle: String = "Vecinos"
    let cornerRadius: CGFloat = 24
    let imageHeight: CGFloat = 50
    let shadowColor: Color = Color.gray.opacity(0.3)
    let shadowRadius: CGFloat = 2
    let shadowXOffset: CGFloat = 4
    let shadowYOffset: CGFloat = 4
    let descriptionBackgroundColor: Color = Color("descriptionBackground")
    let cardBackgrounColor: Color = Color("villagerCard")
    
    var body: some View {
        ScrollView {
            descriptionView
            LazyVGrid (
                columns: [
                    column,
                    column
                ]
            ) {
                ForEach(villagers, id: \.self) { villager in
                    VStack {
                        imageView
                        textView
                    }
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(cardBackgrounColor)
                    }
                    .shadow(
                        color: shadowColor,
                        radius: shadowRadius,
                        x: shadowXOffset,
                        y: shadowYOffset
                    )
                    
                }
            }
            
        }
        .navigationTitle(screenTitle)
        
    }
    
    var descriptionView: some View {
        Text("En la siguiente lista puedes ver los vecinos de tu isla!\nApresurate a conocerl@s a tod@s.\n\nRecuerda que puedes regalar items a tus vecinos para mejorar tu relacion.")
            .padding()
            .background(descriptionBackgroundColor, in: RoundedRectangle(cornerRadius: cornerRadius))
            
    }
    
    var imageView: some View {
        Image(systemName: "person.fill")
            .resizable()
            .scaledToFit()
            .frame(height: imageHeight)
    }
    
    var textView: some View {
        Text("Hola")
            .frame(maxWidth: .infinity, alignment: .center)
        
    }
}

#Preview {
    NavigationStack {
        NeighboursView()
    }
}

