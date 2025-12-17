//
//  FossilsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 14/11/25.
//

import SwiftUI

struct FossilsView: BaseView {
    @StateObject var viewModel = FossilsViewModel()
    
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
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 150))]
    }
    
    var collectionList: some View {
        LazyVGrid (
            columns: columns
        ) {
            ForEach(viewModel.modelView.collectionItems, id: \.id) { collectionItem in
                NavigationLink(value: collectionItem) {
                    ACCard(
                        model: collectionItem) { _ in
                            
                        } likeAction: { _ in
                            viewModel.handleLikedItem(collectionItem)
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    FossilsView()
}
