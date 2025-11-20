//
//  SettingsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/11/25.
//

import SwiftUI

struct SettingsView: BaseView {
    @EnvironmentObject var themeManager: ThemeManager
    @StateObject var viewModel: SettingsViewModel
    
    init(
        viewModel: SettingsViewModel = SettingsViewModel()
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            themeSetting
        }
//        .onAppear {
//            //TODO: conectar con el valor que tiene en el UserDefaults
//            if let isDark = viewModel.getTheme() {
//                themeManager.isDark = isDark
//            }
//        }
        .onChange(
            of: themeManager.isDark
        ) { newValue in
                //TODO: cambiar el valor que tiene en el UserDefaults
//            userDefaultManager.set(value: newValue, forKey: .theme)
            viewModel.setTheme(isDark: newValue)
        }
    }
    
    var themeSetting: some View {
        Toggle("Tema", isOn: $themeManager.isDark)
            .padding(.horizontal)
    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeManager())
}
