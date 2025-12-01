//
//  RadioButtonModelView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 25/11/25.
//

import Foundation
import SwiftUI

struct RadioButtonModelView: BaseModelView, ACRadioButtonModel, Identifiable {
    let id = UUID()
    var label: String
    var isSelected: Bool
    
    init(
        label: String,
        isSelected: Bool = false
    ) {
        self.label = label
        self.isSelected = isSelected
    }
}

extension RadioButtonModelView {
    static let option1 = RadioButtonModelView(
        label: "Opción 1",
    )
    
    static let option2 = RadioButtonModelView(
        label: "Opción 2"
    )
    
    static let option3 = RadioButtonModelView(
        label: "Opción 3"
    )
}
