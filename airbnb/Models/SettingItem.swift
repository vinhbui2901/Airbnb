//
//  SettingItem.swift
//  airbnb
//
//  Created by Thanh Nguyen Huu on 13/2/25.
//

import Foundation

struct SettingItem: Identifiable, Hashable {
    let id = UUID()
    let iconName: String
    let title: String
}
