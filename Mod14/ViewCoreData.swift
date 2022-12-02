
import UIKit
import CoreData
import Alamofire
import SVProgressHUD

class ViewCoreData: UIView {
    
    let CoreData = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    fileprivate let general = ViewControllerCoreData()
    fileprivate let name = Persistance.sharing.NameData
    fileprivate let Secondname = Persistance.sharing.SecondnameData
    
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var Assistant: UIButton!
    @IBOutlet weak var TaskText: UITextView!
    
  
    @IBAction func YesTap(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Tasks(context: context)
        task.name = username()
        task.date = date()
        task.text = TaskText.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        print("-")
        print("Время: \(date())")
        print("UUID: \(NSUUID().uuidString.lowercased())")
        print("User: \(self.username())")
        print("\(self.TaskText.text ?? "* - *")")
        print("- ")
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            super.alpha = 0
            super.center.y -= UIScreen.main.bounds.height
        }, completion: { _ in
            super.removeFromSuperview()
        })
    }
    
    @IBAction func NoTap(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            super.alpha = 0
            super.center.y += UIScreen.main.bounds.height
        }, completion: { _ in
            super.removeFromSuperview()
            print("--")
        })
    }
    
    @IBAction func FishTextGen(_ sender: Any) {
        SVProgressHUD.show(withStatus:"в процессе")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.TextGenerator()
        }
        SVProgressHUD.dismiss(withDelay: 1.0)
    }
    
    static func loadFromNIB() -> ViewCoreData {
        let nib = UINib(nibName: "ViewCoreData", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! ViewCoreData
    }
    
    func username() -> String {
            if ((name?.isEmpty) == nil) && ((Secondname?.isEmpty) == nil) {
                return "anonymous"
            } else if ((name?.isEmpty) != nil) && ((Secondname?.isEmpty) == nil) {
                return "\(name!)"
            } else if ((name?.isEmpty) == nil) && ((Secondname?.isEmpty) != nil) {
                return "\(Secondname!)"
            } else {
                return "\(name!) \(Secondname!)"
            }
        }


    func date() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: (TimeZone.current.abbreviation() ?? "GMT"))
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        let strTime = dateFormatter.string(from: date)
        return strTime
    }
    
   
    func TextGenerator() {
        AF.request("https://fish-text.ru/get?format=html&number=2").response { response in
            if let data = response.data, let utf8 = String(data: data, encoding: .utf8) {
                self.TaskText.text = utf8.components(separatedBy: ["<", ">", "p", "/"]).joined().trimmingCharacters(in: .whitespacesAndNewlines)
            } else {
                SVProgressHUD.showError(withStatus: "--")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.TaskText.textAlignment = .center
                    self.TaskText.font = .systemFont(ofSize: 25)
                    self.TaskText.text = "--"
                }
                SVProgressHUD.dismiss(withDelay: 1.0)
            }
        }
    }
}
