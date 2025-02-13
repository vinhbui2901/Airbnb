//
//  TripsView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NotLoginView(
            page: NotLoginPageItem(
                title: "Trips",
                subtitle: "No trips yet",
                message: "When your're ready to plamn ypour next trip, we here to help"))
    }
}

#Preview {
    TripsView()
}
