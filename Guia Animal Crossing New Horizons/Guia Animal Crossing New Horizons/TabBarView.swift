//
//  TabBarView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 24/10/25.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var themeManager = ThemeManager()
    
    var body: some View {
        TabView {
            NavigationStack {
                VillagersView()
                    .navigationDestination(for: VillagerModel.self) { villager in
                        VillagerDetailsView(
                            viewModel: VillagerDetailViewModel(
                                modelView: villager
                            )
                        )
                    }
            }
            .tabItem {
                Label("Vecinos", systemImage: "person.fill")
            }
            
            NavigationStack {
                FishesView()
                    .navigationDestination(for: FishModel.self) { fish in
                        FishDetailsView(
                            viewModel: FishDetailViewModel(modelView: fish)
                        )
                            .navigationTitle(Text(fish.name))
                    }
            }
            .tabItem {
                Label("Peces", systemImage: "fish.fill")
            }
            
            NavigationStack {
                BugsView()
                    .navigationDestination(for: BugModel.self) { bug in
                        BugsDetailsView(
                            viewModel: BugDetailViewModel(modelView: bug)
                        )
                            .navigationTitle(Text(bug.name))
                    }
            }
            .tabItem {
                Label("Bichos", systemImage: "ladybug.fill")
            }
            
            NavigationStack {
                FossilsView()
                    .navigationDestination(for: FossilModel.self) { fossil in
                        FossilDetailsView(
                            viewModel: FossilDetailViewModel(modelView: fossil)
                        )
                        .navigationTitle(Text(fossil.name))
                    }
            }
            .tabItem {
                Label("Fósiles", systemImage: "fossil.shell.fill")
            }
            
            SettingsView()
                .tabItem {
                    Label("Ajustes", systemImage: "gear")
                }
                .environmentObject(themeManager)
        }
        .preferredColorScheme(themeManager.getScheme())
        .onAppear {
            //TODO: conectar con el valor que tiene en el UserDefaults
            if let isDark = UserDefaultsManager().get(forKey: .theme, type: Bool.self) {
                themeManager.isDark = isDark
            }
        }
    }
}

#Preview {
    TabBarView()
}
