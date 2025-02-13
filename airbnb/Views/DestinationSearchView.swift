//
//  DestinationSearchView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 12/2/25.
//

import SwiftUI

enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show : Bool
    @ObservedObject var viewModel : ExploreViewModel;
    @State private var startDate : Date = Date()
    @State private var endDate : Date = Date()
    @State private var guests = 0;
    @State private var selectedDestination: DestinationSearchOption = .location
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            HStack {
                Button {
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if viewModel.loaction.isEmpty {
                    Button {
                        withAnimation(.snappy){
                            viewModel.loaction = ""
                            viewModel.updateListingForLocation()
                        }
                    }label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.footnote)
                    }
                }
                
            }
            
            //
            VStack {
                if(selectedDestination == .location) {
                    VStack(alignment: .leading) {
                        Text("Where to ?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Search Destination", text: $viewModel.loaction)
                                .onSubmit {
                                    viewModel.updateListingForLocation()
                                    show.toggle()
                                }
                        }.frame(height: 14)
                            .padding(.vertical)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(Color(.systemGray4))
                            }
                    }
                }else{
                    CollapsePickerView(title: "Where to ?", description: "add destination")
                }
            }
            .modifier(CollapsePickerViewModifier())
            .frame(height: selectedDestination == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedDestination = .location
                }
            }
            
            
            //date selection
            VStack {
                if(selectedDestination == .dates) {
                    VStack (alignment: .leading) {
                        Text("When's your trip")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        VStack {
                            DatePicker("From",
                                       selection: $startDate,
                                       displayedComponents: .date)
                            
                            Divider()
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        }
                    }
                }else {
                    CollapsePickerView(title: "When", description: "add date ").padding(.vertical)
                }
            }
            .modifier(CollapsePickerViewModifier())
            .frame(height: selectedDestination == .dates ? 180 : 50)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedDestination = .dates
                }
            }
            
            
        // run guests view
            VStack {
                if(selectedDestination == .guests) {
                    VStack (alignment: .leading){
                        Text("Where tp ? ")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        HStack {
                            Text(" \(guests) Guests")
                                .font(.subheadline)
                            Spacer()
                            Stepper {
                                
                            }onIncrement: {
                                guests += 1
                            }onDecrement: {
                                if (guests == 0) {
                                    return
                                }
                                guests -= 1
                            }
                        }
                    }
                }else {
                    CollapsePickerView(title: "Who", description: "Add Guests ")
                }
            }
            .modifier(CollapsePickerViewModifier())
            .frame(height: selectedDestination == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedDestination = .guests
                }
                
            }
            
            Spacer()
        }.padding()
            .overlay(alignment: .bottom){
                HStack {
                    Button {
                        viewModel.loaction = "";
                        guests = 0;
                        startDate = Date()
                        endDate = Date()
                        viewModel.updateListingForLocation()
                    }label: {
                        Text("Clear all")
                            .foregroundStyle(.black)
                            .underline()
                    }
                    Spacer()
                    Button {
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.white)
                            Text("Search")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }.foregroundStyle(.white)
                            .font(.subheadline)
                            .frame(width: 140, height: 50)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                .frame(height: 70)
                .background(.white)
            }
            .toolbar(.hidden, for: .tabBar)
            .background(Color(.systemGray5))
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}
