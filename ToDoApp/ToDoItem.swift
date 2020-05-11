//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by user174672 on 5/11/20.
//  Copyright © 2020 Iuga. All rights reserved.
//

import Foundation
import CoreData
public class ToDoItem:NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
    @NSManaged public var completed:Bool
}
extension ToDoItem{
    static func getAllToDoItems()-> NSFetchRequest<ToDoItem>{
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors=[sortDescriptor]
        
        return request
    }
}
