//
//  SettingsViewModel.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/11/25.
//

import Foundation
import Combine

class SettingsViewModel: BaseViewModel {
    @Published var modelView: SettingsModelView
    @Published var state: ViewModelState
    let userDefaultManager = UserDefaultsManager()
    
    init(
        modelView: SettingsModelView = SettingsModelView(),
        state: ViewModelState = .initial
    ) {
        self.modelView = modelView
        self.state = state
    }
    
    func onAppear() {
//        userDefaultManager.set(value: modelView.isDark, forKey: .theme)
        let userTheme = userDefaultManager.get(forKey: .theme, type: Bool.self)
        userDefaultManager.set(value: userTheme, forKey: .theme)
    }
    
    func getTheme() -> Bool? {
        let userTheme = userDefaultManager.get(forKey: .theme, type: Bool.self)
        return userTheme
    }
    
    func setTheme(isDark: Bool) {
        userDefaultManager.set(value: isDark, forKey: .theme)
    }
}
