//
//  ACDetailsTemplate.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 31/10/25.
//

import SwiftUI

protocol ACDetailsModel {
    var action: String { get }
    var info: String { get }
    var buyer: String { get }
    
    var image: Image { get }
    var catchPhrase: String { get }
    var location: String { get }
    var time: String { get }
    var importantInfo: String { get }
    var abailabilityNorth: String { get }
    var abailabilitySouth: String { get }
    var sellingPriceNook: Int { get }
    var sellingPriceOther: Int { get }
    var backgroundColor: Color { get }
}

struct ACDetailsTemplate: View {
    let model: ACDetailsModel
    
    let size: CGFloat = 24
    
    init(
        model: ACDetailsModel
    ) {
        self.model = model
    }
    
    var body: some View {
        detailsLayout
    }
    
    var detailsLayout: some View {
        List{
            imageView
            catchPhraseView
            Section (
                header: Text("Información de \(model.action)")
                    .foregroundStyle(Color.white)
            ){
                locationView
                importantInfoView
                timeView
            }
            
            Section (
                header: Text("Disponibilidad")
                    .foregroundStyle(Color.white)
            ){
                abailabilityNorthView
                abailabilitySouthView
            }
            Section (
                header: Text("Información de venta")
                    .foregroundStyle(Color.white)
            ){
                sellingNookView
                sellingOtherView
            }
            
            
        }
        .background(model.backgroundColor)
        .scrollContentBackground(.hidden)
    }
    
    var imageView: some View {
        model.image
            .resizable()
            .scaledToFit()
            .frame(width: .infinity)
    }
    
    var catchPhraseView: some View {
        Text(model.catchPhrase)
            .font(.system(size: size))
    }
    
    var locationView: some View {
        viewType(title: "Lugar: ", content: model.location)
        
    }
    
    var importantInfoView: some View {
        viewType(title: model.info, content: model.importantInfo)
    }
    
    var timeView: some View {
        viewType(title: "Hora: ", content: model.time)
    }
    
    var abailabilityNorthView: some View {
        viewType(title: "Hemisferio norte: ", content: model.abailabilityNorth)
    }
    
    var abailabilitySouthView: some View {
        viewType(title: "Hemisferio sur: ", content: model.abailabilitySouth)
    }
    
    var sellingNookView: some View {
        viewType(title: "Tom Nook: ", content: "\(model.sellingPriceNook) bayas")
    }
    
    var sellingOtherView: some View {
        viewType(title: model.buyer, content: "\(model.sellingPriceOther) bayas")
    }
    
    func viewType(title: String, content: String) -> some View {
        HStack {
            Text(title)
            Text(content)
                .font(.system(size: size))
        }
    }
}

