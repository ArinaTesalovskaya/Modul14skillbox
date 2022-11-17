

import UIKit
import CoreData
import SVProgressHUD
class ViewControllerCoreData: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    let CoreData = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks = [Tasks]()
        
    @IBAction func AddButtonTouch(_ sender: Any) {
    
            addButton.isEnabled = false
            constraints = super.view.constraints.count
            //        self.updateTime?.invalidate()
            let addForm = ViewCoreData.loadFromNIB()
            self.view.addSubview(addForm)
            addForm.TaskText.becomeFirstResponder()
            addForm.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                addForm.center = self.view.center
            })
            updaterStart()
        }
        
        func getData() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                tasks = try context.fetch(Tasks.fetchRequest())
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        
        var updateTime: Timer?; var delay = 1.5; var constraints = 0
        
        @objc func updater(){
            if constraints != super.view.constraints.count {
                getData(); tableView.reloadData();
            } else {
                //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.getData(); self.tableView.reloadData()
                self.addButton.isEnabled = true
                self.updateTime?.invalidate()
                print("обновление")
                //            }
            }
        }
        
        func updaterStart() {
            self.updateTime = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(self.updater), userInfo: nil, repeats: true) }
        

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            SVProgressHUD.show(withStatus:"обновление")
            SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: self.view.frame.width / 2, vertical: self.view.frame.height / 2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.getData()
                self.tableView.reloadData()
            }
            SVProgressHUD.dismiss(withDelay: 1.0)
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            self.updateTime?.invalidate()
        }
    }

    extension ViewControllerCoreData: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCellCoreData
            let row = tasks[indexPath.row]
            cell.NameSecondname.text = row.name
            cell.DateTime.text = "\(row.date!)"
            cell.TaskText.text = row.text
            return cell
        }
    }
    
    
  

