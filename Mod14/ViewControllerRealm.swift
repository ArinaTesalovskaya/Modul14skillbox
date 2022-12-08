

import UIKit
import RealmSwift

class ViewControllerRealm: UIViewController {

    var todo: Results<ToDoClass>!

   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AddTaskButton: UIButton!
    
    @IBAction func AddTaskButtonTouch(_ sender: Any) {
    
        self.updateTime?.invalidate()
        let AddForm = AddForm.loadFromNIB()
        self.view.addSubview(AddForm)
        let hash = AddForm.hash
        if hash != 0 {
            print("\(hash)")
        }
        AddForm.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            AddForm.center = self.view.center
        })
        AddForm.Task.becomeFirstResponder()
        updaterStart()
        
    }
    
    
    @IBAction func backRealm(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var updateTime: Timer?
    var delay = 1.0
    
    @objc func updater(){
        self.tableView.reloadData()
    }
    
    func updaterStart() {
        self.updateTime = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(self.updater), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.updateTime?.invalidate()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.todo = ClassRealm.shared.getTasks()
        
    }
}

extension ViewControllerRealm: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todo.count
        
//        if todo.count != 0 {
//            return 0
//        } else {
//            return 0
//        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRealm") as! CellRealm
        let row = self.todo[indexPath.row]
        cell.DateTime.text = row.date
        cell.TaskText.text = row.task
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completion in
                ClassRealm.shared.remove(todo: self.todo[indexPath.row])
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            return UISwipeActionsConfiguration(actions: [action])
        }
}
