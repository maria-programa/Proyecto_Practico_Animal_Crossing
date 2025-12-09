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
        
        loadSavedRadioSelection()
    }
    
    //    func onAppear() {
    //       userDefaultManager.set(value: modelView.isDark, forKey: .theme)
    //        let userTheme = userDefaultManager.get(forKey: .theme, type: Bool.self)
    //        userDefaultManager.set(value: userTheme, forKey: .theme)
    //    }
    
    func getTheme() -> Bool? {
        let userTheme = userDefaultManager.get(forKey: .theme, type: Bool.self)
        return userTheme
    }
    
    func setTheme(isDark: Bool) {
        userDefaultManager.set(value: isDark, forKey: .theme)
    }
    
    func handleSelectedRadioButton(_ model: RadioButtonModelView) {
        guard let index = modelView.radioButtonCollection.firstIndex(of: model)
        else {
            return
        }
        
        if model.isSelected == false {
            modelView.radioButtonCollection.indices.forEach {
                modelView.radioButtonCollection[$0].isSelected = false
            }
            modelView.radioButtonCollection[index].isSelected = true
            saveRadioButton(model.label)
        } else {
            modelView.radioButtonCollection[index].isSelected = false
            deleteRadioButton()
        }
    }
    
    private func getRadioButton() -> String {
        guard let savedRadioButton = userDefaultManager.get(forKey: .selectedRadioButton, type: String.self)
        else {
            return ""
        }
        return savedRadioButton
    }
    
    private func setRadioButton(_ label: String) {
        userDefaultManager.set(value: label, forKey: .selectedRadioButton)
    }
    
    private func loadSavedRadioSelection() {
        let saved = getRadioButton()
        guard !saved.isEmpty else { return }

        modelView.radioButtonCollection.indices.forEach { index in
            modelView.radioButtonCollection[index].isSelected =
                (modelView.radioButtonCollection[index].label == saved)
        }
    }
    
    private func saveRadioButton(_ label: String) {
        let saved = getRadioButton()
            
        if saved.isEmpty || saved != label {
            setRadioButton(label)
        }
    }
    
    private func deleteRadioButton() {
        let savedRadioButton = getRadioButton()
        guard !savedRadioButton.isEmpty
        else {
            return
        }
        setRadioButton("")
    }
}
