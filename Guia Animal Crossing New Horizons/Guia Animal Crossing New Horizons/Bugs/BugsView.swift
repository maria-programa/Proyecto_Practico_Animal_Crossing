//
//  BugsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import SwiftUI

struct BugsView: ACCollectionTemplate {
    let model: BugsModelView = BugsModelView()
    
    func onCardTapped(model: any ACCardModel) {
        print("\(model.name) was tapped")
    }
}

#Preview {
    NavigationStack {
        BugsView()
    }
}
