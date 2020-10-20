//
//  Users+CoreDataProperties.swift
//  mekedi
//
//  Created by prk on 03/09/20.
//  Copyright © 2020 prk. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
