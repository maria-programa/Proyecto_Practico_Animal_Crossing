//
//  FavouritesView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/12/25.
//

import SwiftUI

struct FavouritesView: BaseView {
    @StateObject var viewModel = FavouritesViewModel()
    
    var body: some View {
        List {
            if !viewModel.modelView.likedVillagers.isEmpty {
                Section(
                    header: Text("Vecinos")
                ) {
                    likedVillagersView
                }
            }
            
            if !viewModel.modelView.likedFishes.isEmpty {
                Section(
                    header: Text("Peces")
                ) {
                    likedFishesView
                }
            }
            
            if !viewModel.modelView.likedBugs.isEmpty {
                Section(
                    header: Text("Bichos")
                ) {
                    likedBugsView
                }
            }
            
            if !viewModel.modelView.likedFossils.isEmpty {
                Section(
                    header: Text("Fósiles")
                ) {
                    likedFossilsView
                }
            }
        }
        .navigationTitle(viewModel.modelView.screenTitle)
        .onAppear {
            viewModel.loadLikedItems()
        }
    }
    
    var likedVillagersView: some View {
        ForEach(viewModel.modelView.likedVillagers, id: \.self) { likedVillagers in
            Text(likedVillagers)
        }
    }
    
    var likedFishesView: some View {
        ForEach(viewModel.modelView.likedFishes, id: \.self) { likedFishes in
            Text(likedFishes)
        }
    }
    
    var likedBugsView: some View {
        ForEach(viewModel.modelView.likedBugs, id: \.self) { likedBugs in
            Text(likedBugs)
        }
    }
    
    var likedFossilsView: some View {
        ForEach(viewModel.modelView.likedFossils, id: \.self) { likedFossils in
            Text(likedFossils)
        }
    }
}

#Preview {
    FavouritesView()
}
