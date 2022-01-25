//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/13/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    init() {
        UITableView.appearance().backgroundColor = .orange
    }
    var body: some View {
        NavigationView {
            List {
                ForEach (assignmentList.assignmentItems) { assignmentItem in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(assignmentItem.course)
                                .font(.headline)
                            Text(assignmentItem.description)
                        }
                        Spacer()
                        Text(assignmentItem.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentList.assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.assignmentItems.remove(atOffsets: indexSet)
                })
                .background (
                    LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom))
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            
            .navigationBarTitle("Assignment List", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
