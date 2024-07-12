//
//  EditTaskView.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 11/07/24.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let task: TaskModel!
    @State private var taskName: String = ""
    @State private var priority = 0
    @State private var dueDate = Date()
    @State private var hasDueDate = false
    
    
    var body: some View {
        Form {
            Label(title: {
                TextField("Task name", text: $taskName)
            }, icon: {
                Image(systemName: "pencil.circle.fill")
            })
            
            VStack(alignment: .leading) {
                Label("Priority", systemImage: "diamond.circle.fill")
                
                Picker("", selection: $priority) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Toggle("Due Date", systemImage: "calendar", isOn: $hasDueDate)
            
            if hasDueDate {
                DatePicker("", selection: $dueDate)
                    .datePickerStyle(.graphical)
            }
            
            Button("Save") {
                task.taskName = taskName
                task.priority = priority
                task.dueDate = hasDueDate ? dueDate : nil
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)

            
        }
        .toolbar {
            Button {
                let newTask = TaskModel(taskName: "New Task", priority: 3)
                modelContext.insert(newTask)
            } label: {
                Image(systemName: "plus")
            }
        }
        .task {
            taskName = task.viewTaskName
            priority = task.priority
            hasDueDate = task.dueDate != nil
            dueDate = task.dueDate ?? Date()
            
        }
        .navigationTitle("Edit Task")
    }
}

#Preview {
    let _ = TaskModel.preview
    let previewTask = TaskModel(taskName: "Preview Task", priority: 2)
    
    return NavigationStack {
        EditTaskView(task: previewTask)
    }
}
