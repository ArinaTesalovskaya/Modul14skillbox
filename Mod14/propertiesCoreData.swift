//
//  propertiesCoreData.swift
//  Mod14
//
//  Created by Arina Tesalovskaya on 16.11.2022.
//

import Foundation
import CoreData

extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: String?
    @NSManaged public var name: String?

}
