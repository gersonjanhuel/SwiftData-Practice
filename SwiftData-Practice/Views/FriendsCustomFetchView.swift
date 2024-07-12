//
//  FriendsCustomFetchView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 09/07/24.
//

import SwiftUI
import SwiftData

struct FriendsCustomFetchView: View {
    @Query(Friend.friendsUnder30) private var friends: [Friend]
    
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
    FriendsCustomFetchView()
        .modelContainer(Friend.preview)
}
