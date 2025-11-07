//
//  BaseViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 6/11/25.
//

import SwiftUI

enum ViewModelState {
    case initial
    case loading
    case success
    case failure
}

protocol BaseViewModel: ObservableObject {
    associatedtype ModelView: BaseModelView
    
    var modelView: ModelView { get set }
    var state: ViewModelState { get set }
}
