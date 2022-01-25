//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 1/19/22.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignmentItems : [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(assignmentItems) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let assignmentItems = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: assignmentItems) {
                self.assignmentItems = decoded
                return
            }
        }
        assignmentItems = []
    }
}
