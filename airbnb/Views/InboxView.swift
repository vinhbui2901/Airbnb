//
//  InboxView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NotLoginView(
            page: NotLoginPageItem(
                title: "Inbox",
                subtitle: "Login to see messages",
                message: "Once you login, you'll find messages from hosts here"))
    }
}

#Preview {
    InboxView()
}
