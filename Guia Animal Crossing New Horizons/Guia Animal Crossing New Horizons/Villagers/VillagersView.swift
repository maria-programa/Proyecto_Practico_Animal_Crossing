//
//  VillagersView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/10/25.
//

import SwiftUI

struct VillagersView: ACCollectionTemplate {
    let model: VillagersModelView = VillagersModelView()
    
    func onCardTapped(model: any ACCardModel) {
        print("\(model.name) was tapped")
    }
}

#Preview {
    NavigationStack {
        VillagersView()
    }
}

