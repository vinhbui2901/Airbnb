//
//  CollapsePickerViewModifier.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 12/2/25.
//

import SwiftUI

struct CollapsePickerViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
    }
}
