//
//  ViewControllerUserDefaults.swift
//  Mod14
//
//  Created by Arina Tesalovskaya on 16.11.2022.
//


import UIKit

class ViewControllerUserDefaults: UIViewController {
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Secondname: UITextField!
    @IBOutlet weak var GagView: UIView!
    @IBOutlet weak var Welcome: UILabel!
    @IBOutlet weak var RealmImage: UIImageView!
    @IBOutlet weak var CoreDataImage: UIImageView!
    @IBOutlet weak var RealmSection: UIButton!
    @IBOutlet weak var CoreDataSection: UIButton!
    
    @IBAction func NameEdit(_ sender: Any) {
      Persistance.sharing.NameData = Name.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    @IBAction func SecondnameEdit(_ sender: Any) {
        Persistance.sharing.SecondnameData = Secondname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    @IBAction func NameCleaner(_ sender: Any) {
        (Name.text, Secondname.text) = (nil, nil)
        Persistance.sharing.NameData = nil
//        Persistance.sharing.Secondname = nil
        transitionFlipFromTop(Name)
        transitionFlipFromBottom(Secondname)
        Name.becomeFirstResponder()
        Hello()
    }
    
    @IBAction func RealmTap(_ sender: Any) {
        disableAnimationImage()
    }
    
    @IBAction func CoreDataTap(_ sender: Any) {
        disableAnimationImage()
    }
    
    @IBAction func Exit(_ sender: Any) {
        exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RealmSection.layer.zPosition = 1
        CoreDataSection.layer.zPosition = 1
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Persistance.sharing.NameData != nil {
            transitionFlipFromTop(Name)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.Name.text = Persistance.sharing.NameData
            }
        }
        if Persistance.sharing.SecondnameData != nil {
            transitionFlipFromTop(Secondname)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.Secondname.text = Persistance.sharing.SecondnameData
            }
        }
        Hello()
    }
}
