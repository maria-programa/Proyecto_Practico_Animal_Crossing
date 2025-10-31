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
    let cardAction: ((ACCardModel) -> Void)
    
    @State private var isLiked: Bool = false
    //MARK: Card Constants
    let spacing: CGFloat = 8
    let cornerRadius: CGFloat = 24
    let imageHeight: CGFloat = 50
    let shadowColor: Color = Color.gray.opacity(0.3)
    let shadowRadius: CGFloat = 2
    let shadowXOffset: CGFloat = 4
    let shadowYOffset: CGFloat = 4
    let descriptionBackgroundColor: Color = Color("descriptionBackground")
    
    init(
        model: ACCardModel,
        cardAction: @escaping ((ACCardModel) -> Void)
    ) {
        self.model = model
        self.cardAction = cardAction
    }
    
    var body: some View {
        cardLayout
    }
    
    var cardLayout: some View {
        VStack (
            spacing: spacing
        ) {
            imageView
            HStack {
                textView
                likeButton
            }
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
    
    var likeButton: some View {
        Button {
            withAnimation {
                isLiked.toggle()
            }
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(height: isLiked ? 25 : 20)
                .foregroundStyle(isLiked ? .red : .white)
        }
        
    }
}


#Preview {
    ACCard(model: FishModel.mock1) { model in
        print("\(model.name) was tapped")
    }
}
