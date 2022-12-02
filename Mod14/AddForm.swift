

import UIKit
import RealmSwift

class AddForm: UIView {
    
    fileprivate let realm = try! Realm()
    fileprivate let general = ViewControllerRealm()
    fileprivate let todoinfo = ToDoClass()
    let name = Persistance.sharing.NameData
    let secondname = Persistance.sharing.SecondnameData
    
    @IBOutlet weak var Task: UITextView!
    @IBOutlet weak var Cancel: UIButton!
    @IBOutlet weak var Add: UIButton!
    
   @IBAction func AddTouch(_ sender: Any) {
        ClassRealm.shared.add(tasktext: self.Task.text)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.center.y -= UIScreen.main.bounds.height
        }, completion: { _ in
            super.removeFromSuperview()
        })
        let rc = ClassRealm()
        print("UIID: \(self.todoinfo.uuid)")
        print("Дата и время: \(rc.DateString())")
        print("Пользователь: \(username())")
        if self.Task.text.count > 0 {
            print("\(self.Task.text!)")
        } else {
            print("Zero")
        }
        print("-")
    }
    

    @IBAction func CancelTouch(_ sender: Any) {
    
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.center.y += UIScreen.main.bounds.height
        }, completion: { _ in
            super.removeFromSuperview()
        })
        
        let rc = ClassRealm()
        print("UIID: \(self.todoinfo.uuid)")
        print("Дата и время: \(rc.DateString())")
        print("Пользователь: \(username())")
        print("!")
        print("- -")
    }
    
    static func loadFromNIB() -> AddForm{
        let nib = UINib(nibName: "AddForm", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! AddForm
    }
    
    func username() -> String {
        if ((name?.isEmpty) == nil) && ((secondname?.isEmpty) == nil) {
            return "anonymous"
        } else if ((name?.isEmpty) != nil) && ((secondname?.isEmpty) == nil) {
            return "\(name!)"
        } else if ((name?.isEmpty) == nil) && ((secondname?.isEmpty) != nil) {
            return "\(secondname!)"
        } else {
            return "\(name!) \(secondname!)"
        }
    }
}
