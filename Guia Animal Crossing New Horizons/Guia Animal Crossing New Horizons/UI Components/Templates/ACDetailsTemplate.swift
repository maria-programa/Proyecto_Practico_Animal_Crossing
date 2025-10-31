//
//  ACDetailsTemplate.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 31/10/25.
//

import SwiftUI

protocol ACDetailsModel {
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
                header: Text("Información de pesca")
                    .foregroundStyle(Color.white)
            ){
                locationView
                importantInfoView
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
        HStack {
            Text("Lugar: ")
            Text(model.location)
                .font(.system(size: size))
        }
        
    }
    
    var importantInfoView: some View {
        HStack {
            Text("Sombra: ")
            Text(model.importantInfo)
                .font(.system(size: size))
        }
    }
    
    var abailabilityNorthView: some View {
        HStack {
            Text("Hemisferio norte: ")
            Text(model.abailabilityNorth)
                .font(.system(size: size))
        }
    }
    
    var abailabilitySouthView: some View {
        HStack {
            Text("Hemisferio sur: ")
            Text(model.abailabilitySouth)
                .font(.system(size: size))
        }
    }
    
    var sellingNookView: some View {
        HStack {
            Text("Tom Nook: ")
            Text("\(model.sellingPriceNook) bayas")
                .font(.system(size: size))
        }
    }
    
    var sellingOtherView: some View {
        HStack {
            Text("CJ: ")
            Text("\(model.sellingPriceOther) bayas")
                .font(.system(size: size))
        }
    }
}

