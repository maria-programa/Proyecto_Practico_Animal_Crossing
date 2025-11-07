//
//  ACCollectionTemplate.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import SwiftUI

//A este protocol le pasamos los parametros que van a variar de cada modelo, en este caso el titulo, la descripción y los items de cada colección van a ser distintos
protocol ACCollectionTemplateModel {
    associatedtype ItemModel: ACCardModel, Identifiable, Hashable
    
    var screenTitle: String { get }
    var description: String { get }
    var collectionItems: [ItemModel] { get }
}

//A este protocol le pasamos las vistas que tendrán todas las pantallas e nuestra aplicación que usen este template
protocol ACCollectionTemplate: View {
    associatedtype Model: ACCollectionTemplateModel
    associatedtype DescriptionView: View
    associatedtype CollectionList: View
    
    var model: Model { get }
    var descriptionView: DescriptionView { get }
    var column: GridItem { get }
    var collectionList: CollectionList { get }
}

extension ACCollectionTemplate {
    
    var body: some View {
        VStack {
            ScrollView {
                descriptionView
                collectionList
            }
        }
        .navigationTitle(model.screenTitle)
    }
    
    var descriptionView: some View {
        Text(model.description)
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
            ForEach(model.collectionItems, id: \.id) { collectionItem in
                NavigationLink(value: collectionItem) {
                    ACCard(model: collectionItem) { _ in
                        
                    }
                }
            }
        }
    }
}
