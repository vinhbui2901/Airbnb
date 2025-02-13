//
//  WishListView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NotLoginView(
            page: NotLoginPageItem(
                title: "WishLists",
                subtitle: "Login to view your WishLists",
                message: "You can create, view or edit WishLists once you've logged in"))
    }
}

#Preview {
    WishListView()
}
