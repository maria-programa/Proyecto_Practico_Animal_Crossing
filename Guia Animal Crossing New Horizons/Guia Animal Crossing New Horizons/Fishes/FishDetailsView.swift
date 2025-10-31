//
//  FishDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 29/10/25.
//

import SwiftUI

struct FishDetailsView: View {
    let fish: FishModel
    
    var body: some View {
        fishDetailsLayout
    }
    
    var fishDetailsLayout: some View {
        List{
            fishImage
            fishCatchPhrase
            Section (
                header: Text("Información de pesca")
                    .foregroundStyle(Color.white)
            ){
                fishLocation
                fishShadowSize
            }
            
            Section (
                header: Text("Disponibilidad")
                    .foregroundStyle(Color.white)
            ){
                fishAbailabilityNorth
                fishAbailabilitySouth
            }
            Section (
                header: Text("Información de venta")
                    .foregroundStyle(Color.white)
            ){
                fishSellingNook
                fishSellingCJ
            }
            
            
        }
        .background(Color.blue)
        .scrollContentBackground(.hidden)
    }
    
    var fishImage: some View {
        fish.image
            .resizable()
            .scaledToFit()
            .frame(width: .infinity)
    }

    var fishCatchPhrase: some View {
        Text(fish.catchPhrase)
            .font(.system(size: 24))
    }

    var fishLocation: some View {
        HStack {
            Text("Lugar: ")
            Text(fish.location)
                .font(.system(size: 24))
        }
        
    }

    var fishShadowSize: some View {
        HStack {
            Text("Sombra: ")
            Text(fish.shadowSize)
                .font(.system(size: 24))
        }
    }

    var fishAbailabilityNorth: some View {
        HStack {
            Text("Hemisferio norte: ")
            Text(fish.abailabilityNorth)
                .font(.system(size: 24))
        }
    }

    var fishAbailabilitySouth: some View {
        HStack {
            Text("Hemisferio sur: ")
            Text(fish.abailabilitySouth)
                .font(.system(size: 24))
        }
    }

    var fishSellingNook: some View {
        HStack {
            Text("Tom Nook: ")
            Text("\(fish.sellingPriceNook) bayas")
                .font(.system(size: 24))
        }
    }

    var fishSellingCJ: some View {
        HStack {
            Text("CJ: ")
            Text("\(fish.sellingPriceCJ) bayas")
                .font(.system(size: 24))
        }
    }
}



#Preview {
    FishDetailsView(fish: FishModel.mock1)
}
