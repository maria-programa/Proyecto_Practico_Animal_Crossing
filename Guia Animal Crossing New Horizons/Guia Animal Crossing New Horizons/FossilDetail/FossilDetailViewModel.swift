//
//  FossilDetailViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/11/25.
//

import Foundation
import SwiftUI
import Combine

class FossilDetailViewModel: BaseViewModel {
    @Published var modelView: FossilModel
    @Published var state: ViewModelState
    
    init(
        modelView: FossilModel,
        state: ViewModelState = .initial
    ) {
        self.modelView = modelView
        self.state = state
    }
}
