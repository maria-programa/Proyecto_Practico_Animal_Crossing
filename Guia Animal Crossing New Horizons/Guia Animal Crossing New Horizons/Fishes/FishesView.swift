//
//  FishesView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import SwiftUI

struct FishesView: ACCollectionTemplate {
    let model: FishesModelView = FishesModelView()
    
    func onCardTapped(model: any ACCardModel) {
        print("\(model.name) was tapped")
    }
}

#Preview {
    NavigationStack {
        FishesView()
    }
}
