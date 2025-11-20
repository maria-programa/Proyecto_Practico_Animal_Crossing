//
//  ThemeManager.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 17/11/25.
//

import Foundation
import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var isDark: Bool
    
    init(isDark: Bool = false) {
        self.isDark = isDark
    }
    
    func getScheme() -> ColorScheme {
        return isDark ? .dark : .light
    }
}
