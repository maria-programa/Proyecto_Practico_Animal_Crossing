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
            if viewModel.modelView.favouritesIsEmpty {
                Text("Aún no hay favoritos")
            }
            
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
        ForEach(Array(viewModel.favouritesStore.villagers.values), id: \.villagerID) { likedVillager in
            NavigationLink(destination: VillagerDetailsView(viewModel: VillagerDetailViewModel(modelView: likedVillager))) {
                HStack {
                    AsyncImage(
                        url: likedVillager.iconURL
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    } placeholder: {
                        likedVillager.defaultImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                    }
                    
                    Spacer()
                        .frame(width: 24)
                    
                    Text(likedVillager.name)
                }
            }
        }
    }
    
    var likedFishesView: some View {
        ForEach(Array(viewModel.favouritesStore.fishes.values), id: \.specie) { likedFishes in
            NavigationLink(destination: FishDetailsView(viewModel: FishDetailViewModel(modelView: likedFishes))) {
                HStack {
                    AsyncImage(
                        url: likedFishes.imageURL
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32)
                    } placeholder: {
                        likedFishes.defaultImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                    }
                    
                    Spacer()
                        .frame(width: 24)
                    
                    Text(likedFishes.name)
                }
            }
        }
    }
    
    var likedBugsView: some View {
        ForEach(Array(viewModel.favouritesStore.bugs.values), id: \.specie) { likedBugs in
            NavigationLink(destination: BugsDetailsView(viewModel: BugDetailViewModel(modelView: likedBugs))) {
                HStack {
                    AsyncImage(
                        url: likedBugs.imageURL
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32)
                    } placeholder: {
                        likedBugs.defaultImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                    }
                    
                    Spacer()
                        .frame(width: 24)
                    
                    Text(likedBugs.name)
                }
            }
        }
    }
    
    var likedFossilsView: some View {
        ForEach(Array(viewModel.favouritesStore.fossils.values), id: \.name) { likedFossils in
            HStack {
                AsyncImage(
                    url: likedFossils.imageURL
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                } placeholder: {
                    likedFossils.defaultImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                }
                
                Spacer()
                    .frame(width: 24)
                
                Text(likedFossils.name)
            }
        }
    }
}

#Preview {
    FavouritesView()
}
