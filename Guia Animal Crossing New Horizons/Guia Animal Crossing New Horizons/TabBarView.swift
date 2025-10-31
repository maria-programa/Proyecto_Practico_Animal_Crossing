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
            NavigationStack {
                VillagersView()
                    .navigationDestination(for: VillagerModel.self) { villager in
                        VillagerDetailsView(villager: villager)
                    }
            }
            .tabItem {
                Label("Vecinos", systemImage: "person.fill")
            }
            
            NavigationStack {
                FishesView()
                    .navigationDestination(for: FishModel.self) { fish in
                        FishDetailsView(fish: fish)
                            .navigationTitle(Text(fish.name))
                    }
            }
            .tabItem {
                Label("Peces", systemImage: "fish.fill")
            }
            
            NavigationStack {
                BugsView()
                    .navigationDestination(for: BugModel.self) { bug in
                        Text("Detail for: \(bug.name)")
                    }
            }
            .tabItem {
                Label("Bichos", systemImage: "ladybug.fill")
            }
        }
    }
}

#Preview {
    TabBarView()
}
