//
//  TabBarView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 24/10/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            VillagersView()
                .tabItem {
                    Label("Vecinos", systemImage: "person.fill")
                }
            FishesView()
                .tabItem {
                    Label("Peces", systemImage: "fish.fill")
                }
            BugsView()
                .tabItem {
                    Label("Bichos", systemImage: "ladybug.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
