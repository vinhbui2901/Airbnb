//
//  ExplorerView.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import SwiftUI

struct ExplorerView: View {
    @State private var showDestinationSearchView = false;
    @StateObject var viewModel = ExploreViewModel(service: ExploreService());
    
    var body: some View {
        NavigationStack {
            if(showDestinationSearchView) {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            }else {
                VStack {
                    SearchAndFilterBarView(location: $viewModel.loaction)
                        .onTapGesture {
                            print(viewModel.listings.count)
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                        }
                    }
                    CategoryCarouselView()
                    ScrollView {
                        
                        LazyVStack (spacing: 32){
                            
                            
                            ForEach( viewModel.listings) { listing in
                                NavigationLink(value: listing){
                                    ListingItemView(listing: listing, canBeShare: true)
                                        .frame(height: 420)
                                        .padding(.bottom, 20)
                                }
                            }
                        }.padding()
                        
                    }
                    .navigationDestination(for: ListingModel.self) { listing in
                        ExplorerDetailView(listing: listing)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
    }
}

#Preview {
    ExplorerView()
}

