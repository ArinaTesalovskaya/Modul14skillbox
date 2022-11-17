
import Foundation
import RealmSwift

class ToDoClass: Object {
    @objc dynamic var date: String = "ToDoClass: date"
    @objc dynamic var uuid: String = NSUUID().uuidString.lowercased()
    @objc dynamic var task: String = "ToDoClass: task"
    @objc dynamic var isCompleted: Bool = false
    
    func uuiddata() -> String {
        let UUID = NSUUID().uuidString.lowercased()
        return UUID
    }
}
