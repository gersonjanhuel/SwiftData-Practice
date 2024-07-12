//
//  InsuranceModel.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 11/07/24.
//

import Foundation
import SwiftData

@Model
class InsuranceModel {
    var location: String
    
    @Relationship
    var item: ItemModel?
    
    init(location: String, item: ItemModel? = nil) {
        self.location = location
        self.item = item
    }
    
}
