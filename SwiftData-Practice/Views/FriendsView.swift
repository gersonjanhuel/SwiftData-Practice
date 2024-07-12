//
//  FriendsView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 01/07/24.
//

import SwiftUI
import SwiftData

struct FriendsView: View {
    @Query<Friend>(filter: #Predicate {
        $0.age <= 27
    }, sort: [SortDescriptor(\.age, order: .forward)]) private var friends: [Friend]
    
    var body: some View {
        List(friends) { friend in
            HStack {
                Text(friend.viewName, format: .name(style: .medium))
                Text("(\(friend.age))")
            }
        }
    }
}

#Preview {
    
    // Example of using Schema
    
    let schema = Schema([Friend.self])
    let container = try! ModelContainer(for: schema)
    
    return FriendsView()
        .modelContainer(container)
}
