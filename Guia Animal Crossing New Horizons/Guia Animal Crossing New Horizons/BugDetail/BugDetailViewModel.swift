//
//  BugDetailViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 10/11/25.
//

import Foundation
import SwiftUI
import Combine

class BugDetailViewModel: BaseViewModel {
    @Published var modelView: BugModel
    @Published var state: ViewModelState
    
    init(
        modelView: BugModel,
        state: ViewModelState = .initial
    ) {
        self.modelView = modelView
        self.state = state
    }
}
