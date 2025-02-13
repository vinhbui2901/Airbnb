//
//  NotLoginView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 13/2/25.
//

import SwiftUI

struct NotLoginPageItem {
    var title: String;
    var subtitle : String;
    var message : String;
}

struct NotLoginView: View {
    var page : NotLoginPageItem
    @State var isLoginOrSignUp : Bool = false;
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                Text(page.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(alignment: .leading, spacing: 10) {
                    Text(page.subtitle)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(page.message)
                        .font(.title3)
                        .foregroundStyle(.gray)
                    Button {
                        isLoginOrSignUp = true
                    } label: {
                        Text("Login")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(width: 140, height: 60)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Spacer()
                    }
                    .padding(.top, 60)
                    .sheet(isPresented: $isLoginOrSignUp) {
                        LoginOrSignUpView(dissis: $isLoginOrSignUp)
                    }
                }.padding()
            }.padding()
        }
    }
}

#Preview {
    NotLoginView(page: NotLoginPageItem(
        title: "Profile",
        subtitle: "Log in to view your wistlists",
        message: "You can create, view, or edit wishlists once you've logged in"))
}
