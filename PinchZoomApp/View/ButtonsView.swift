//
//  ButtonsView.swift
//  PinchZoomApp
//
//  Created by Samed Semih Sürmeli on 8.02.2022.
//

import SwiftUI

struct ButtonsView: View {
    var iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .symbolRenderingMode(.hierarchical)
            .font(.system(size: 36))
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(iconName: "plus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
