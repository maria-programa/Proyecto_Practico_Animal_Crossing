//
//  ContentView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/10/25.
//

import SwiftUI

struct ContentView: View {
    let villagers = ["Munchi", "Teddy", "Melba", "Celeste", "Ariel", "Tere", "Lope", "Paulino"]
    
    var body: some View {
        ScrollView {
            LazyVGrid (
                columns: [
                    GridItem(.fixed(150)),
                    GridItem(.fixed(150))
                ]
            ) {
                ForEach(villagers, id: \.self) { villager in
                    VStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        Text(villager)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.mint)
                    }
                }
            }
            
        }
        .navigationTitle("Vecinos")
        
    }
}

#Preview {
    ContentView()
}

