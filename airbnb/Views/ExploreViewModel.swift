//
//  ExportViewModel.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import Foundation

class ExploreViewModel : ObservableObject {
    @Published var listings = [ListingModel]()
    @Published var loaction : String = ""
    
    private let service: ExploreService
    private var listingCopy = [ListingModel]()
    
    init(service: ExploreService) {
        self.service = service
        Task {await fetchListings()}
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchLintings()
            self.listingCopy = self.listings
        }catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation(){
        let filteredListings = listings.filter({
            $0.city.lowercased().contains(self.loaction.lowercased()) ||
            $0.state.lowercased().contains(self.loaction.lowercased())
        })
        self.listings = (filteredListings.isEmpty && loaction.isEmpty) ? listingCopy : filteredListings
    }
}
