//
//  Item.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
