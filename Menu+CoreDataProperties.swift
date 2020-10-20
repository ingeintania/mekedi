//
//  Menu+CoreDataProperties.swift
//  mekedi
//
//  Created by prk on 04/09/20.
//  Copyright © 2020 prk. All rights reserved.
//
//

import Foundation
import CoreData


extension Menu {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Menu> {
        return NSFetchRequest<Menu>(entityName: "Menu")
    }

    @NSManaged public var desc: String?
    @NSManaged public var name: String?

}
