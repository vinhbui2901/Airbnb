//
//  SplashView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    var body: some View {
        ZStack {
            Rectangle().fill(.white)
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation {
                    self.isActive = false
                }
            }
        })
    }
}

#Preview {
    SplashView(isActive: .constant(true))
}
