//
//  FishDetailViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 10/11/25.
//

import Foundation
import SwiftUI
import Combine

class FishDetailViewModel: BaseViewModel {
    @Published var modelView: FishModel
    @Published var state: ViewModelState
    
    init(
        modelView: FishModel,
        state: ViewModelState = .initial
    ) {
        self.modelView = modelView
        self.state = state
    }
    
}
