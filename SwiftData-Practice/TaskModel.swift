//
//  TaskModel.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 10/07/24.
//

import SwiftUI
import SwiftData

@Model
class TaskModel {
    var taskName: String
    var completedDate: Date?
    var priority: Int // can be 1, 2, or 3
    var dueDate: Date?
    
    init(taskName: String, completedDate: Date? = nil, priority: Int, dueDate: Date? = nil) {
        self.taskName = taskName
        self.completedDate = completedDate
        self.priority = priority
        self.dueDate = dueDate
    }
}

extension TaskModel {
    var viewTaskName: String {
        taskName.isEmpty ? "[Enter Task Name]" : taskName
    }
    
    var isComplete: Bool {
        completedDate == nil ? false : true
    }
    
    var viewPriority: String {
        "\(priority).circle.fill" // For SF Symbol name
    }
    
    var viewDueDate: String {
        dueDate?.formatted(date: .numeric, time: .omitted) ?? ""
    }
    
    var viewPriorityColor: Color {
        if completedDate != nil {
            return .gray // Completed
        } else if priority == 1 {
            return .green
        } else if priority == 1 {
            return .orange
        }
        
        return .red // 3
    }

}

extension TaskModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: TaskModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        //insert task object with due date
        let taskWithDueDate = TaskModel(taskName: "Preview Meeting", priority: 1)
        taskWithDueDate.dueDate = dateFormatter.date(from: "2-10-2025")!
        container.mainContext.insert(taskWithDueDate)
        
        container.mainContext.insert(TaskModel(taskName: "Shop gift", priority: 2))
        container.mainContext.insert(TaskModel(taskName: "Drop kids", priority: 3))
        
        return container
    }
}
