//
//  ContentView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 01/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(animation: .easeOut(duration: 2)) private var people: [Person]
    
    var body: some View {
        Button("Add Person") {
            let name = ["Mark", "Gilles", "Gilbert", "Rowan"].randomElement()!
            
            let newPerson = Person(name: name, age: 35)
            
            modelContext.insert(newPerson)
        }
        
        List(people) { person in
            Text(person.name)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Person.self)
}
