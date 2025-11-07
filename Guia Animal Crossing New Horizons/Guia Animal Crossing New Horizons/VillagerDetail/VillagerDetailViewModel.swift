//
//  VillagerDetailViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 7/11/25.
//

import Foundation
import SwiftUI
import Combine

class VillagerDetailViewModel: BaseViewModel {
    @Published var modelView: VillagerModel
    @Published var state: ViewModelState
    
    init(
        modelView: VillagerModel,
        state: ViewModelState = .initial
    ) {
        self.modelView = modelView
        self.state = state
    }
}
