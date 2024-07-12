//
//  Friend.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 01/07/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

extension Friend {
    var viewName: PersonNameComponents {
        PersonNameComponents(givenName: firstName, familyName: lastName)
    }
}

extension Friend {
    static var friendsUnder30: FetchDescriptor<Friend> {
        let fetch = FetchDescriptor<Friend>(predicate: #Predicate {
            $0.age <= 27
        }, sortBy: [SortDescriptor(\.age, order: .forward)])
        
        return fetch
    }
}



extension Friend {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Friend.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Friend(firstName: "Jason", lastName: "Barlow", age: 25))
        container.mainContext.insert(Friend(firstName: "Jennie", lastName: "Wilkinson", age: 27))
        container.mainContext.insert(Friend(firstName: "Lauren", lastName: "Brady", age: 26))
        container.mainContext.insert(Friend(firstName: "Matthew", lastName: "Schultz", age: 30))
        
        return container
    }
}
