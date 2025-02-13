//
//  ExplorerDetailView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 13/2/25.
//

import SwiftUI
import MapKit

struct ExplorerDetailView: View {
    @Environment(\.dismiss) var dismiss;
    var listing : ListingModel
    @State private var cameraPosition : MapCameraPosition
    
    init(listing: ListingModel) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longgitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack (alignment: .topLeading){
                ListingItemCarouselView()
                    .frame(height: 350)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }.padding(32)
                }
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(listing.city) \(listing.state) - \(listing.type.description) ")
                        .font(.title2)
                    HStack (alignment: .center){
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.yellow)
                        Text("\(listing.rating.formatted())")
                            .font(.caption)
                        Text("22 reviews")
                            .font(.caption)
                        Spacer()
                    }
                    Text(listing.address)
                        .font(.caption)
                }
                Divider()
                HStack {
                    VStack(alignment: .leading, spacing: 8){
                        Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                            .font(.headline)
                            .frame(width: 250, alignment: .leading)
                            .fontWeight(.bold)
                        HStack {
                            Text("\(listing.numberOfGuests) Guests")
                                .font(.caption)
                            Text("\(listing.numberOfBedrooms) Bedrooms")
                                .font(.caption)
                            Text("\(listing.numberOfBathrooms) Bath")
                                .font(.caption)
                            Text("\(listing.numberOfBeds) Beds")
                                .font(.caption)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                }
                Divider()
                VStack (alignment: .leading) {
                    Text("Where you will sleep")
                        .font(.headline)
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0..<listing.numberOfBedrooms, id: \.self) {item in
                                VStack (alignment: .center) {
                                    Image(systemName: "bed.double");
                                    Text("Bedroom \(item + 1)")
                                }.frame(width: 132, height: 100)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray)
                                    }
                            }
                        }
                    }.scrollTargetBehavior(.paging)
                }.padding(.vertical)
                Divider()
                
                VStack (alignment: .leading) {
                    Text("What this place offer")
                        .font(.headline)
                    VStack {
                        ForEach(listing.amentities){ item in
                            HStack (alignment: .center, spacing: 30){
                                Image(systemName: item.imageName)
                                Text("\(item.title)")
                                Spacer()
                            }.padding(.vertical, 5)
                        }
                    }.padding(.vertical, 9)
                }.padding(.vertical)
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Where you will be")
                        .font(.headline)
                    Map( position: $cameraPosition)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }.padding(.vertical)
                Spacer(minLength: 90)
            }.padding()
                .frame(alignment: .leading)
            Spacer(minLength: 40)
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNigth)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Tobal Before tax")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.subheadline)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding()
            .background(.white)
            .borderBottom(width: 1, edges: [.top], color: .black)
        }
    }
}

#Preview {
    ExplorerDetailView(listing: DeveloperPreview.shared.mockListings[0])
}
