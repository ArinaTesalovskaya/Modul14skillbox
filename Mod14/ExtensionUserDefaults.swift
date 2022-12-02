
import UIKit

extension ViewControllerUserDefaults {
    
    func transitionFlipFromTop(_ viewToAnimate: UITextField) {
        UITextField.transition(
            with: viewToAnimate,
            duration: 0.5,
            options: .transitionFlipFromTop,
            animations: nil,
            completion: nil)
    }
    func transitionFlipFromBottom(_ viewToAnimate: UITextField) {
        UITextField.transition(
            with: viewToAnimate,
            duration: 0.5,
            options: .transitionFlipFromBottom,
            animations: nil,
            completion: nil)
    }
    func Hello() {
        if Persistance.sharing.FirstRunData == "false" {
            func username() -> String {
                let name = Persistance.sharing.NameData
                let secondname = Persistance.sharing.SecondnameData
                if ((name?.isEmpty) == nil) && ((secondname?.isEmpty) == nil) {
                    return "anon"
                } else if ((name?.isEmpty) != nil) && ((secondname?.isEmpty) == nil) {
                    return "\(name!)"
                } else if ((name?.isEmpty) == nil) && ((secondname?.isEmpty) != nil) {
                    return "\(secondname!)"
                } else {
                    return "\(name!) \(secondname!)"
                }
            }
           
            self.Welcome.alpha = 1
        
//            DispatchQueue.main.async {
//                UIView.animate(
//                    withDuration: 0.2,
//                    delay: 0,
//                    options: [.repeat, .autoreverse, .curveEaseInOut],
//                    animations: {
//                        self.GagView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 10)///change
//                    });
//            }
            RealmSection.setBackgroundImage(UIImage(named: "realm"), for: UIControl.State.normal)
            self.Welcome.text = "Здравствуйте, \(username())"
            self.Welcome.textAlignment = .center
            self.Welcome.font = .systemFont(ofSize: 25)
        } else {
            print("Приложение запущено \(Date())")
            Persistance.sharing.FirstRunData = "false"
            DispatchQueue.main.async {
                self.Welcome.text = "Welcome"
                self.RealmImage.frame.origin.x += super.view.frame.width
                self.CoreDataImage.frame.origin.x -= super.view.frame.width
                self.Welcome.frame.origin.y -= super.view.frame.height
                self.GagView.frame.origin.y -= super.view.frame.height
                self.Welcome.alpha = 1
                self.GagView.alpha = 1
                
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0.5,
                    options: .curveEaseInOut,
                    animations: {
                        self.Welcome.frame.origin.y += self.view.frame.height
                    });
                
                UIView.animate(
                    withDuration: 0.20,
                    delay: 2.0,
                    options: .repeat,
                    animations: {
                        self.Welcome.alpha = 0
                    });
                
                UIView.animate(
                    withDuration: 0.5,
                    delay: 1.5,
                    options: .curveEaseInOut,
                    animations: {
                        self.GagView.frame.origin.y += self.view.frame.height
                    });
                
                UIView.animate(
                    withDuration: 0.25,
                    delay: 1.75,
                    options: .repeat,
                    animations: {
                       
                    });
                
                UIView.animate(
                    withDuration: 0.5,
                    delay: 2,
                    options: .curveEaseInOut,
                    animations: {
                        self.RealmImage.frame.origin.x -= self.view.frame.width
                    });
                
                UIView.animate(
                    withDuration: 0.5,
                    delay: 2,
                    options: .curveEaseInOut,
                    animations: {
                        self.CoreDataImage.frame.origin.x += self.view.frame.width
                    });
                
                UIView.animate(
                    withDuration: 0.2,
                    delay: 2.75,
                    options: [.repeat, .autoreverse, .curveEaseInOut],
                    animations: {
                        self.GagView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 5)
                    });
                
                UIView.animate(
                    withDuration: 0.2,
                    delay: 2.5,
                    options: [.repeat, .autoreverse, .curveEaseInOut],
                    animations: {
                        self.RealmImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 15)
                    });
                
                UIView.animate(
                    withDuration: 0.2,
                    delay: 2.5,
                    options: [.repeat, .autoreverse, .curveEaseInOut],
                    animations: {
                        self.CoreDataImage.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 1)
                    });
            }
        }
    }
    func disableAnimationImage() {
        self.RealmSection.setBackgroundImage(UIImage(named: "realm"), for: UIControl.State.normal)
        self.CoreDataSection.setBackgroundImage(UIImage(named: "coredata"), for: UIControl.State.normal)
        self.RealmImage.isHidden = true
        self.CoreDataImage.isHidden = true
        self.Welcome.alpha = 1
        self.GagView.transform = CGAffineTransform(rotationAngle: 0)
    }
}
