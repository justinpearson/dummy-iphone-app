import Foundation
import SwiftData

@Model
class TodoItem {
    var title: String
    var isCompleted: Bool
    var createdAt: Date

    init(title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
