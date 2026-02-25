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
        NavigationStack {
            VStack(
                alignment: .leading
            ) {
                themeSetting
                Spacer()
                    .frame(height: 24)
                radioButtons
                Spacer()
                    .frame(height: 24)
                favourites
            }
        }
        .onChange(
            of: themeManager.isDark
        ) { newValue in
            viewModel.setTheme(isDark: newValue)
        }
    }
    
    var themeSetting: some View {
        Toggle("Tema", isOn: $themeManager.isDark)
            .padding(.horizontal)
    }
    
    var radioButtons: some View {
        VStack(
            alignment: .leading
        ) {
            Text("Mostrar peces")
            ForEach(viewModel.modelView.radioButtonCollection, id: \.self) {
                radioButton in ACRadioButton(model: radioButton) { _ in
                    viewModel.handleSelectedRadioButton(radioButton)
                }
            }
        }
        .padding(.horizontal)
    }
    
    var favourites: some View {
        NavigationLink {
            FavouritesView()
        } label: {
            HStack {
                Text("Favoritos")
                    .foregroundStyle(.black)
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeManager())
}
