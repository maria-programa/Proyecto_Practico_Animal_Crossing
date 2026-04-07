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
        loadSavedBirthdayRadioSelection()
    }
    
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
            saveRadioButton(model.label, .selectedRadioButton)
        } else {
            modelView.radioButtonCollection[index].isSelected = false
            deleteRadioButton(.selectedRadioButton)
        }
    }
    
    func handleSelectedVillagerRadioButton(_ model: RadioButtonModelView) {
        guard let index = modelView.radioButtonVillagers.firstIndex(of: model)
        else {
            return
        }
        
        if model.isSelected == false {
            modelView.radioButtonVillagers.indices.forEach {
                modelView.radioButtonVillagers[$0].isSelected = false
            }
            modelView.radioButtonVillagers[index].isSelected = true
            saveRadioButton(model.label, .selectedVillagerRadioButton)
        } else {
            modelView.radioButtonVillagers[index].isSelected = false
            deleteRadioButton(.selectedVillagerRadioButton)
        }
    }
    
    private func getRadioButton(_ forKey: UserDefaultKeys) -> String {
        guard let savedRadioButton = userDefaultManager.get(forKey: forKey, type: String.self)
        else {
            return ""
        }
        return savedRadioButton
    }
    
    private func setRadioButton(_ label: String, _ forKey: UserDefaultKeys) {
        userDefaultManager.set(value: label, forKey: forKey)
    }
    
    private func loadSavedRadioSelection() {
        let saved = getRadioButton(.selectedRadioButton)
        guard !saved.isEmpty else { return }

        modelView.radioButtonCollection.indices.forEach { index in
            modelView.radioButtonCollection[index].isSelected =
                (modelView.radioButtonCollection[index].label == saved)
        }
    }
    
    private func loadSavedBirthdayRadioSelection() {
        let saved = getRadioButton(.selectedVillagerRadioButton)
        guard !saved.isEmpty else { return }
        
        modelView.radioButtonVillagers.indices.forEach { index in
            modelView.radioButtonVillagers[index].isSelected =
                (modelView.radioButtonVillagers[index].label == saved)
        }
    }
    
    private func saveRadioButton(_ label: String, _ forKey: UserDefaultKeys) {
        let saved = getRadioButton(forKey)
            
        if saved.isEmpty || saved != label {
            setRadioButton(label, forKey)
        }
    }
    
    private func deleteRadioButton(_ forKey: UserDefaultKeys) {
        let savedRadioButton = getRadioButton(forKey)
        guard !savedRadioButton.isEmpty
        else {
            return
        }
        setRadioButton("", forKey)
    }
}
