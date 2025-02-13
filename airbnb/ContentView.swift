//
//  ContentView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct ContentView: View {
    @State var isSplashViewActive = true
    var body: some View {
        if (isSplashViewActive) {
            SplashView(isActive: $isSplashViewActive)
        } else {
            DashboardView()
        }
    }
}

#Preview {
    ContentView()
}
