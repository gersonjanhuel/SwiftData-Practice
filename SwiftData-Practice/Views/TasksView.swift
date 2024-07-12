//
//  TasksView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 11/07/24.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query<TaskModel>(sort: [SortDescriptor(\.completedDate), SortDescriptor(\.priority)])
    
    private var tasks: [TaskModel]
    
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        
                        EditTaskView(task: task)
                        
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.taskName)
                                
                                Text(task.viewDueDate)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Image(systemName: task.viewPriority)
                                .foregroundColor(task.viewPriorityColor)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(tasks[index])
                    }
                    
                })
            }
        }
    }
}

#Preview {
    TasksView()
        .modelContainer(TaskModel.preview)
}
