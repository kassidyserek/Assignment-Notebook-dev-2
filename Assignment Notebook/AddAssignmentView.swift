//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/19/22.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList : AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Math", "Science", "English", "History", "World Lanuguage", "Misc"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                .foregroundColor(.white)
                .background (
                    LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom))
                TextField("Description", text: $description)
                    .foregroundColor(.orange)
                    .background(Color.white)
                    .padding()
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let assignmentItem = AssignmentItem(id: UUID(), course: course,
                                                        description: description, dueDate: dueDate)
                    assignmentList.assignmentItems.append(assignmentItem)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
