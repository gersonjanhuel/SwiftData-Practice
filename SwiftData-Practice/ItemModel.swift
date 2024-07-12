//
//  ItemModel.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 11/07/24.
//

import Foundation
import SwiftData

@Model
class ItemModel {
    var name: String
    var image: Data
    
    @Relationship(inverse: \InsuranceModel.item)
    var insurance: InsuranceModel?
    
    init(name: String, image: Data, insurance: InsuranceModel? = nil) {
        self.name = name
        self.image = image
        self.insurance = insurance
    }
    
}
