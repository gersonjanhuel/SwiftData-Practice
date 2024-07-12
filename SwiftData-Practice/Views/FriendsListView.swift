//
//  FriendsListView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 08/07/24.
//

import SwiftUI
import SwiftData

struct FriendsListView: View {
    @Query private var friends: [Friend]
    
    init(sortOrder: SortOrder, filterOn: Bool) {
        let sort = [SortDescriptor(\Friend.age, order: sortOrder)]
        let filter = #Predicate<Friend> {
            $0.age < 27
        }
        
        // re-query technique
        _friends = Query(filter: filterOn ? filter : nil, sort: sort)
    }
    
    var body: some View {
        List(friends) { friend in
            HStack {
                Text(friend.firstName)
                Text(friend.lastName)
                Text("(\(friend.age))")
            }
        }
    }
}

#Preview {
    FriendsListView(sortOrder: SortOrder.forward, filterOn: true)
        .modelContainer(Friend.preview)
}
