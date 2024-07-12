//
//  FriendsDynamicFetchSortView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 09/07/24.
//

import SwiftUI
import SwiftData

struct FriendsDynamicFetchSortView: View {
    @Environment(\.modelContext) var modelContext
    @State private var friends: [Friend] = []
    @State private var sortByProperty = \Friend.firstName
    @State private var orderAscending = true
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    Text(friend.firstName)
                    Text(friend.lastName)
                    Text("(\(friend.age))")
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                Menu("Sort By") {
                    Picker("",selection: $sortByProperty) {
                        Text("Name").tag(\Friend.firstName)
                        Text("Age").tag(\Friend.age)
                    }
                    .pickerStyle(.inline)
                }
                
                Button("", systemImage: "arrow.up.arrow.down.circle") {
                    orderAscending.toggle()
                    updateParks()
                }
                .symbolVariant(orderAscending ? .none : .fill)
            }
            .onChange(of: sortByProperty) {
                updateParks()
            }
            
        }
        .onAppear {
            updateParks()
        }
    }
    
    func updateParks() {
        var descriptor = FetchDescriptor<Friend>()
        descriptor.sortBy = [SortDescriptor(sortByProperty, order: orderAscending ? .forward : .reverse)]
        
        friends = try! modelContext.fetch(descriptor)
    }
}

#Preview {
    FriendsDynamicFetchSortView().modelContainer(Friend.preview)
}
