//
//  CollapsePickerView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 12/2/25.
//

import SwiftUI

struct CollapsePickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview {
    CollapsePickerView(title: "title", description: "description")
}
