//
//  FossilDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/11/25.
//

import SwiftUI

struct FossilDetailsView: BaseView {
    @StateObject var viewModel: FossilDetailViewModel
    
    var body: some View {
        fossilDetailsLayout
    }
    
    var fossilDetailsLayout: some View {
        List {
            imageView
            fossilGroupView
            interactableView
            
            Section(
                header: Text("Información de venta")
            ) {
                sellingInfoView
            }
        }
    }
    
    var imageView: some View {
        AsyncImage(
            url: viewModel.modelView.imageURL
        ) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            viewModel.modelView.defaultImage
                .resizable()
                .scaledToFit()
        }
    }
    
    var fossilGroupView: some View {
        Text(viewModel.modelView.fossilGroup)
            .font(.system(size: 24))
    }
    
    var interactableView: some View {
        Text(viewModel.modelView.interactable ? "Prueba a interactuar con él" : "Este no hace nada")
    }
    
    var sellingInfoView: some View {
        Text("Nook's Crany: \(viewModel.modelView.sellingPrice) bayas")
    }
}

#Preview {
    FossilDetailsView(viewModel: FossilDetailViewModel(modelView: .mock1))
}
