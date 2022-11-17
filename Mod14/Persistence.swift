//
//  persistence.swift
//  Mod14
//
//  Created by Arina Tesalovskaya on 14.03.2022.
//

import Foundation

class Persistance {
    static let sharing = Persistance()
    private let (Name, Secondname) = ("Persistance.Name", "Persistance.Secondname")
    private let FirstRun = ("Persistance.FirstRun")
    var NameData: String? {
        set { UserDefaults.standard.set (newValue, forKey: Name) }
        get { return UserDefaults.standard.string (forKey: Name) }
    }
    var SecondnameData: String? {
        set { UserDefaults.standard.set (newValue, forKey: Secondname) }
        get { return UserDefaults.standard.string (forKey: Secondname) }
    }
    var FirstRunData: String? {
        set { UserDefaults.standard.set (newValue, forKey: FirstRun) }
        get { return UserDefaults.standard.string (forKey: FirstRun) }
    }
}
