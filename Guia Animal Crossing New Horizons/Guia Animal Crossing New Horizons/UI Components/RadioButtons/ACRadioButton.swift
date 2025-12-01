//
//  ACRadioButton.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 24/11/25.
//

import SwiftUI

protocol ACRadioButtonModel {
    var label: String { get }
    var isSelected: Bool { get set }
}

struct ACRadioButton: View {
    let model: ACRadioButtonModel
    let selectAction: ((ACRadioButtonModel) -> Void)
    
    init(
        model: ACRadioButtonModel,
        selectAction: @escaping (ACRadioButtonModel) -> Void
    ) {
        self.model = model
        self.selectAction = selectAction
    }
    
    var body: some View {
        radioButtonLayout
    }
    
    var radioButtonLayout: some View {
        HStack(
            spacing: 8
        ) {
            radioButton
            radioButtonLabel
        }
        .padding()
    }
    
    var radioButton: some View {
        Button {
            withAnimation {
                selectAction(model)
            }
        } label: {
            Image(systemName: model.isSelected ? "inset.filled.circle" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(model.isSelected ? .green : .gray)
        }
    }
    
    var radioButtonLabel: some View {
        Text(model.label)
    }
}

//#Preview {
//    ACRadioButton(model: SettingsRadioButtonsModel.option1) {
//        model in
//    }
//}
