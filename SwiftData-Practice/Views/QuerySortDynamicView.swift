//
//  QuerySortDynamicView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 08/07/24.
//

import SwiftUI
import SwiftData


struct QuerySortDynamicView: View {
    @Query var friends: [Friend]
    @State private var orderAscending = true
    @State private var filterText = ""
    
    // query in-memory
    private var sortedAndSortedFriends: [Friend] {
        let sorted = friends.sorted {
            orderAscending ? $0.age < $1.age : $0.age > $1.age
        }
        
        if filterText.isEmpty {
            return sorted
        }
        
        return sorted.filter {
            $0.firstName.localizedCaseInsensitiveContains(filterText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(sortedAndSortedFriends) { friend in
                HStack {
                    Text(friend.firstName)
                    Text(friend.lastName)
                    Text("(\(friend.age))")
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                Button("", systemImage: "arrow.up.arrow.down.circle") {
                    orderAscending.toggle()
                }
                .symbolVariant(orderAscending ? .none : .fill)
            }
            .searchable(text: $filterText, prompt: "Filter by friend name")
            .overlay {
                if sortedAndSortedFriends.isEmpty {
                    ContentUnavailableView.search
                }
            }
        }
        
    }
}

#Preview {
    QuerySortDynamicView()
        .modelContainer(Friend.preview)
}
