//
//  FishesView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 22/10/25.
//

import SwiftUI

struct FishesView: ACCollectionTemplate {
    let model: FishesModelView = FishesModelView()
}

#Preview {
    NavigationStack {
        FishesView()
    }
}
