//
//  BaseView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 6/11/25.
//

import Foundation
import SwiftUI
import Combine

protocol BaseView: View {
    associatedtype ViewModel: BaseViewModel
    
    var viewModel: ViewModel { get }
}

struct EjemploModelView: BaseModelView {
    var title: String = "Hola"
    let buttonTitle: String = "Change title"
}

class Ejemplo1: BaseViewModel {
    @Published var state: ViewModelState
    @Published var modelView: EjemploModelView
    
    init(
        state: ViewModelState = .initial,
        modelView: EjemploModelView
    ) {
        self.state = state
        self.modelView = modelView
    }
    
    func buttonAction() {
        
        if modelView.title == "Hola" {
            modelView.title = "Adiós"
        } else {
            modelView.title = "Hola"
        }
    }
}

struct VistaEjemplo: BaseView {
    @StateObject var viewModel: Ejemplo1
    
    var body: some View {
        VStack {
            Text(viewModel.modelView.title)
            Button {
                withAnimation {
                    viewModel.buttonAction()
                }
                
            } label: {
                Text(viewModel.modelView.buttonTitle)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    VistaEjemplo(
        viewModel: Ejemplo1(
            modelView: EjemploModelView()
        )
    )
}
