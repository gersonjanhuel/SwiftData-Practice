//
//  SwiftData_PracticeApp.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 01/07/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_PracticeApp: App {
    
    
    var body: some Scene {
        
        WindowGroup {
            FriendsView()
                .modelContainer(for: Friend.self) { result in
                    // this is onSetup parameter closure
                    print("setup done")
                    
                    switch result {
                    case .success(let container):
                        
                        // do something with the container
                        container.mainContext.insert(Friend(firstName: "Sample", lastName: "Sample", age: 7))
                        
                    case .failure(let error):
                        print("setup failure with error: \(error)")
                    }
                }
        }
    }
}
