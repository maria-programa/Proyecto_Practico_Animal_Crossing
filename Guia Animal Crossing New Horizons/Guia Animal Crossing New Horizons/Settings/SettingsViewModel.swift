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
    
    func handleSelectedRadioButton(_ model: RadioButtonModelView) {
        if model.isSelected {
            setRadioButton(model.label)
        }
    }
    
//    private func checkIfModelIsSelected(_ id: String) -> Bool {
//        let savedID = getRadioButton()
//        guard !savedID.isEmpty
//        else {
//            return false
//        }
//        return savedID.contains(id)
//    }
    
    private func getRadioButton() -> String {
        guard let savedRadioButton = userDefaultManager.get(forKey: .selectedRadioButton, type: String.self)
        else {
            return ""
        }
        return savedRadioButton
    }
    
    private func setRadioButton(_ id: String) {
        userDefaultManager.set(value: id, forKey: .selectedRadioButton)
    }
    
    private func saveRadioButton(_ id: String) {
        let saveRadioButton = getRadioButton()
        setRadioButton(id)
    }
    
    private func deleteRadioButton() {
        
    }
}
