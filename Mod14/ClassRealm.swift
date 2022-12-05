

import Foundation
import RealmSwift

class ClassRealm {
    
    static let shared = ClassRealm()
    private let realm = try! Realm()
    

    func getTasks() -> Results<ToDoClass> {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return realm.objects(ToDoClass.self)
    }
    
    func add(tasktext: String) {
        let item = ToDoClass()
        try! realm.write {
            realm.add(item)
            item.date = DateString()
            item.task = tasktext
        }
        realm.refresh()
    }
    
    func remove(todo: ToDoClass) {
        try! realm.write {
            realm.delete(todo)
        }
    }
    
    
    func DateString() -> String {
        let (rawDate, dateFormatter) = (Date(), DateFormatter())
        dateFormatter.dateFormat = "dd.MM.YY HH:mm:ss"
        let DateString = dateFormatter.string(from: rawDate)
        return DateString
    }
}
