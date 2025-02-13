//
//  CategoryItemView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 12/2/25.
//

import SwiftUI

struct CategoryItemView: View {
    var icon : String = "building.2";
    var title: String = "Icons"
    var isActive: Bool = false;
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundStyle(isActive ? .black : .gray)
            Text(title).font(.footnote)
                .foregroundStyle(isActive ? .black : .gray)
        }
    }
}

#Preview {
    CategoryItemView()
}
