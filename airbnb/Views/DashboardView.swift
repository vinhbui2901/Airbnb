//
//  DashboardView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            ExplorerView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishListView()
                .tabItem { Label("Withlist", systemImage: "suit.heart") }
            
            TripsView()
                .tabItem { Label ("Trips", systemImage: "paperplane") }
                            
            InboxView()
                .tabItem { Label ("Inbox", systemImage: "message") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    DashboardView()
}
