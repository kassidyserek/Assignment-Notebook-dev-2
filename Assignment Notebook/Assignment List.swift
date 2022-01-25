//
//  Assignment List.swift
//  Assignment Notebook
//
//  Created by Student on 1/18/22.
//

import Foundation

class AssignmentItems: ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "Chapter 1 HW", dueDate: Date()),
                            AssignmentItem(course: "Science", description: "Finish lab", dueDate: Date()),
                            AssignmentItem(course: "Spanish", description: "Study vocab", dueDate: Date())]
 }
