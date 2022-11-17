
import UIKit

class CellRealm: UITableViewCell {
    
    let forminfo = AddForm()
    
    @IBOutlet weak var NameSecondname: UILabel!
    @IBOutlet weak var DateTime: UILabel!
    @IBOutlet weak var TaskText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let name = self.forminfo.name
        let secondname = self.forminfo.secondname
        
        if ((name?.isEmpty) == nil) && ((secondname?.isEmpty) == nil) {
            NameSecondname.text = "anon"
        } else if ((name?.isEmpty) != nil) && ((secondname?.isEmpty) == nil) {
            NameSecondname.text = "\(name!)"
        } else if ((name?.isEmpty) == nil) && ((secondname?.isEmpty) != nil) {
            NameSecondname.text = "\(secondname!)"
        } else {
            NameSecondname.text = "\(name!) \(secondname!)"
        }
    }
}
