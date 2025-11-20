//
//  VillagerDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 30/10/25.
//

import SwiftUI

struct VillagerDetailsView: BaseView {
    @StateObject var viewModel: VillagerDetailViewModel
    
    var body: some View {
        villagerDetailsLayout
    }
    
    var villagerDetailsLayout: some View {
        List {
            viewTitle
                .listRowSeparatorTint(Color("villagerCard"))
            HStack (spacing: 16) {
                villagerPicture
                VStack (alignment: .leading, spacing: 8) {
                    villagerName
                    villagerBirthday
                    villagerSpecie
                }
            }
            villagerQuote
            villagerPhrase
        }
        .background(Color("villagerCard"))
        .scrollContentBackground(.hidden)
    }
    var viewTitle: some View {
        Text("PASSPORT")
            .font(.title)
    }

    var villagerPicture: some View {
        AsyncImage(
            url: viewModel.modelView.imageURL
        ) { image in
                image
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 150, height: 150)
            } placeholder: {
                viewModel.modelView.defaultImage
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .modifier(Encapsulated(color: Color.black))
            }
    }
    
    var villagerName: some View {
        Text(viewModel.modelView.name)
            .modifier(FontStyle())
    }

    var villagerBirthday: some View {
        Text("\(viewModel.modelView.birthdayDay) of \(viewModel.modelView.birthdayMonth)")
            .modifier(FontStyle())
    }

    var villagerSpecie: some View {
        Text(viewModel.modelView.specie)
            .modifier(FontStyle())
    }

    var villagerQuote: some View {
        Text(viewModel.modelView.quote)
            .modifier(FontStyle())
        
    }

    var villagerPhrase: some View {
        Text("\"\(viewModel.modelView.phrase)\"")
            .modifier(FontStyle())
        
    }
}

struct Encapsulated: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(color, lineWidth: 8))
    }
}

struct FontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
    }
}

#Preview {
    VillagerDetailsView(
        viewModel: VillagerDetailViewModel(modelView: .mock1)
    )
}
