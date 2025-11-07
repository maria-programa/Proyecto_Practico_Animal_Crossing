//
//  BugsDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 31/10/25.
//

import SwiftUI

struct BugsDetailsView: BaseView {
    @StateObject var viewModel: BugsViewModel
    let bug: BugModel
    
    var body: some View {
        ACDetailsTemplate(model: bug)
    }
}

#Preview {
    BugsDetailsView(
        viewModel: BugsViewModel(),
        bug: BugModel.mock1
    )
}
