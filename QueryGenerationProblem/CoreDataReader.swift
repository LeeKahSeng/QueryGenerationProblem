//
//  CoreDataReader.swift
//  QueryGenerationProblem
//
//  Created by Lee Kah Seng on 12/02/2018.
//  Copyright © 2018 Lee Kah Seng. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataReader {
    
    let persistentContainer = NSPersistentContainer(name: "QueryGenerationProblem")
    var obj1: Object1?
    
    init?() {
        
        // Load store
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Object1.self))
        
        persistentContainer.viewContext.shouldDeleteInaccessibleFaults = false
        
        // Pin context to query generation token so that throughout the kiosk flow, data in persistentContainer will not affect by cause by background sync
        do {
            try persistentContainer.viewContext.setQueryGenerationFrom(NSQueryGenerationToken.current)
        } catch {
            fatalError("Failed to set query generation token: \(error)")
        }
        
        // Execute fetch KioskSyncResultEntity
        guard
            let result = try? persistentContainer.viewContext.fetch(fetchRequest).first as? Object1 else {
                return nil
        }
        
        self.obj1 = result
    }
}
