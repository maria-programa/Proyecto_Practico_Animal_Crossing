//
//  ACCard.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 21/10/25.
//

import SwiftUI

protocol ACCardModel {
    var image: Image { get }
    var name: String { get }
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
}

struct ACCard: View {
    let model: ACCardModel
    //MARK: Card Constants
    let spacing: CGFloat = 8
    let cornerRadius: CGFloat = 24
    let imageHeight: CGFloat = 50
    let shadowColor: Color = Color.gray.opacity(0.3)
    let shadowRadius: CGFloat = 2
    let shadowXOffset: CGFloat = 4
    let shadowYOffset: CGFloat = 4
    let descriptionBackgroundColor: Color = Color("descriptionBackground")
    
    init(model: ACCardModel) {
        self.model = model
    }
    
    var body: some View {
        VStack (
            spacing: spacing
        ) {
            imageView
            textView
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(model.backgroundColor)
        }
        .shadow(
            color: shadowColor,
            radius: shadowRadius,
            x: shadowXOffset,
            y: shadowYOffset
        )
    }
    
    var imageView: some View {
        model.image
            .resizable()
            .scaledToFit()
            .frame(height: imageHeight)
    }
    
    var textView: some View {
        Text(model.name)
            .foregroundStyle(model.foregroundColor)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
