//
//  ProfileView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

let paramsSettings: [SettingItem] = [
    SettingItem(iconName: "gear", title: "Settings"),
    SettingItem(iconName: "accessibility", title: "Accessibility"),
    SettingItem(iconName: "questionmark.circle", title: "Get Help")
]

struct ProfileView: View {
    @State private var showingSheet = false
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 15){
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Text("Log in to start planning your next trip")
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                    .padding(.horizontal)
                Button {
                    showingSheet.toggle()
                } label: {
                    Text("Login")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
                .sheet(isPresented: $showingSheet) {
                    LoginOrSignUpView(dissis: $showingSheet)
                }
                
                HStack {
                    Text("Don't have an account")
                        .foregroundStyle(.gray)
                    Button {
                        
                    } label: {
                        Text("SignUp")
                            .foregroundStyle(.gray)
                            .underline()
                    }
                }.padding(.horizontal)
               
                HStack (alignment: .top, spacing: 20){
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Airbnb your place")
                            .font(.headline)
                            .foregroundStyle(.black)
                        Text("It is simple to get set up and start earning")
                            .foregroundStyle(.gray)
                    }.padding()
                    
                    Image("listing-0")
                        .resizable()
                        .frame(width: 100, height: 90)
                        .padding()
                }
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 130)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
                .padding()
                
                VStack {
                    ForEach(paramsSettings, id: \.self){ item in
                        Button {
                            
                        } label: {
                            VStack {
                                HStack {
                                    HStack {
                                        Image(systemName: item.iconName)
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(.gray)
                                            .padding(.trailing, 8)
                                        
                                        Text(item.title)
                                            .font(.title3)
                                            .foregroundStyle(.gray)
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                }.padding(.vertical, 7)
                                Divider()
                            }
                        }
                    }
                }
                .padding()
                Spacer()
                
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
