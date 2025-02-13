//
//  ExploreService.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 11/2/25.
//

import Foundation

class ExploreService {
    func fetchLintings() async throws -> [ListingModel] {
        return DeveloperPreview.shared.mockListings.shuffled()
    }
}
