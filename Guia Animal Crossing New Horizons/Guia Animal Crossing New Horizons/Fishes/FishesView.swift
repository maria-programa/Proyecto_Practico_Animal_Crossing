//
//  FishesView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import SwiftUI

struct FishesView: View {
    @StateObject var viewModel = FishesViewModel()
        
    var body: some View {
        Group {
            switch viewModel.state {
            case .initial, .loading:
                loadingView
            case .success:
                contentView
            case .failure:
                errorView
            }
        }
        .navigationTitle(viewModel.modelView.screenTitle)
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
    
    var loadingView: some View {
        Text("Loading...")
    }
    
    var contentView: some View {
        VStack {
            ScrollView {
                descriptionView
                collectionList
            }
        }
    }
    
    var errorView: some View {
        VStack {
            Text(viewModel.modelView.errorDescription)
            Button {
                Task {
                   await viewModel.onAppear()
                }
            } label: {
                Text("Retry")
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    var descriptionView: some View {
        Text(viewModel.modelView.description)
            .padding()
            .background(
                Color("descriptionBackground"),
                in: RoundedRectangle(cornerRadius: 24)
            )
    }
    
    var column: GridItem {
        GridItem(.fixed(150))
    }
    
    var collectionList: some View {
        LazyVGrid (
            columns: [
                column,
                column
            ]
        ) {
            ForEach(viewModel.modelView.collectionItems, id: \.id) { collectionItem in
                NavigationLink(value: collectionItem) {
                    ACCard(model: collectionItem) { _ in
                        
                    }
                }
            }
        }
    }
    
    func onCardTapped(model: any ACCardModel) {
        print("\(model.name) was tapped")
    }
}

#Preview {
    NavigationStack {
        FishesView()
    }
}
