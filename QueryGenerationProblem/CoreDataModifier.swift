//
//  CoreDataModifier.swift
//  QueryGenerationProblem
//
//  Created by Lee Kah Seng on 29/01/2018.
//  Copyright © 2018 Lee Kah Seng. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataModifier {
    
    static let shared = CoreDataModifier()
    
    // Core data
    private let persistentContainer = NSPersistentContainer(name: "QueryGenerationProblem")
    private var backgroundContext: NSManagedObjectContext
    
    init() {
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        backgroundContext = persistentContainer.newBackgroundContext()
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func generateDate(completion: @escaping () -> Void) {
        
        backgroundContext.perform { [unowned self] in
            
            do {
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Object1.self))
                if let obj1 = try self.backgroundContext.fetch(fetchRequest).first as? Object1 {
                    
                    // Update existing Object1
                    
                    // Delete Object2
                    if let obj2 = obj1.obj2 {
                        self.backgroundContext.delete(obj2)
                    }
                    
                    // Create Object2
                    let obj2 = Object2(context: self.backgroundContext)
                    
                    // Create Object3
                    let obj3 = Object3(context: self.backgroundContext)
                    
                    // Create Object4
                    let obj4 = Object4(context: self.backgroundContext)
                    
                    // Create Object5
                    let obj5 = Object5(context: self.backgroundContext)
                    
                    // Create Object5
                    let obj6 = Object6(context: self.backgroundContext)
                    obj6.now = Date()
                    
                    // Set relationship
                    obj1.obj2 = obj2
                    obj2.obj3 = obj3
                    obj3.obj4 = obj4
                    obj4.obj5 = obj5
                    obj5.obj6 = obj6
                    
                } else {
                    
                    // Create Object1
                    let obj1 = Object1(context: self.backgroundContext)
                    
                    // Create Object2
                    let obj2 = Object2(context: self.backgroundContext)
                    
                    // Create Object3
                    let obj3 = Object3(context: self.backgroundContext)
                    
                    // Create Object4
                    let obj4 = Object4(context: self.backgroundContext)
                    
                    // Create Object5
                    let obj5 = Object5(context: self.backgroundContext)
                    
                    // Create Object5
                    let obj6 = Object6(context: self.backgroundContext)
                    obj6.now = Date()
                    
                    // Set relationship
                    obj1.obj2 = obj2
                    obj2.obj3 = obj3
                    obj3.obj4 = obj4
                    obj4.obj5 = obj5
                    obj5.obj6 = obj6
                }
                
                try self.backgroundContext.save()
                
                completion()
                
            } catch {
                print("Error: \(error)")
            }
            
        }
        
    }
    
//    func generateData(completion: @escaping () -> Void) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: People.self))
//
//        updateContext.perform { [unowned self] in
//            do {
//                let result = try self.updateContext.fetch(fetchRequest) as? [People]
//
//                if let fetchResult = result, !fetchResult.isEmpty {
//
//                    // Updated existing sync result in core data
//                    let people = fetchResult[0]
//
//                    // Delete pet
//                    if let pet = people.pet {
//                        self.updateContext.delete(pet)
//                    }
//
//
//                    // Add obj
//                    let obj4 = PetObj4(context: self.updateContext)
//                    obj4.attribute = 1
//                    obj4.attribute1 = 2.0
//                    obj4.attribute2 = "444444"
//                    obj4.attribute3 = false
//
//                    let obj3 = PetObj3(context: self.updateContext)
//                    obj3.attribute = "333333"
//                    obj3.attribute1 = "333333"
//                    obj3.attribute2 = 4
//                    obj3.attribute3 = 45
//                    obj3.obj4 = obj4
//
//                    let obj2 = PetObj2(context: self.updateContext)
//                    obj2.attribute = "222222"
//                    obj2.attribute1 = "2222222"
//                    obj2.attribute2 = true
//                    obj2.attribute3 = Date()
//                    obj2.obj3 = obj3
//
//                    let obj1 = PetObj1(context: self.updateContext)
//                    obj1.attribute = 23
//                    obj1.attribute1 = 33
//                    obj1.attribute2 = "1111111"
//                    obj1.attribute3 = 22.2
//                    obj1.obj2 = obj2
//
//
//                    // Add pet
//                    let pet = Pet(context: self.updateContext)
//                    pet.name = "Pussy cat"
//                    pet.age = 5
//                    pet.obj1 =  obj1
//                    people.pet = pet
//
//
//                    // Delete car
//                    if let cars = people.car?.allObjects as? [Car] {
//
//                        cars.forEach({ (car) in
//                            self.updateContext.delete(car)
//                        })
//                    }
//
//                    // Add car
//
//                    // Car 1
//                    let alarm1 = AlarmSystem(context: self.updateContext)
//                    alarm1.hasGpsTracking = false
//                    alarm1.hasCentreLocking = false
//                    alarm1.price = 1111
//
//                    let car1 = Car(context: self.updateContext)
//                    car1.carPlat = "AAA111"
//                    car1.alarm = alarm1
//
//
//                    // Car 2
//                    let alarm2 = AlarmSystem(context: self.updateContext)
//                    alarm2.hasGpsTracking = false
//                    alarm2.hasCentreLocking = false
//                    alarm2.price = 2222
//
//                    let car2 = Car(context: self.updateContext)
//                    car2.carPlat = "BBB222"
//                    car2.alarm = alarm2
//
//
//                    // Car 3
//                    let alarm3 = AlarmSystem(context: self.updateContext)
//                    alarm3.hasGpsTracking = false
//                    alarm3.hasCentreLocking = false
//                    alarm3.price = 3333
//
//                    let car3 = Car(context: self.updateContext)
//                    car3.carPlat = "CCC333"
//                    car3.alarm = alarm3
//
//                    // Add cars
//                    people.addToCar(car1)
//                    people.addToCar(car2)
//                    people.addToCar(car3)
//
//                    do {
//                        try self.updateContext.save()
//                    } catch {
//                        assertionFailure("Fail to update people")
//                    }
//
//                } else {
//
//                    // Create new People instance if it is not available in core data
//                    let people = People(context: self.updateContext)
//                    people.name = "John"
//                    people.age = 18
//
//
//                    // Add obj
//                    let obj4 = PetObj4(context: self.updateContext)
//                    obj4.attribute = 1
//                    obj4.attribute1 = 2.0
//                    obj4.attribute2 = "boj4 str"
//                    obj4.attribute3 = false
//
//                    let obj3 = PetObj3(context: self.updateContext)
//                    obj3.attribute = "obj3 str"
//                    obj3.attribute1 = "obj3 str"
//                    obj3.attribute2 = 4
//                    obj3.attribute3 = 45
//                    obj3.obj4 = obj4
//
//                    let obj2 = PetObj2(context: self.updateContext)
//                    obj2.attribute = "obj3 str"
//                    obj2.attribute1 = "obj3 str"
//                    obj2.attribute2 = true
//                    obj2.attribute3 = Date()
//                    obj2.obj3 = obj3
//
//                    let obj1 = PetObj1(context: self.updateContext)
//                    obj1.attribute = 23
//                    obj1.attribute1 = 33
//                    obj1.attribute2 = "obj 1"
//                    obj1.attribute3 = 22.2
//                    obj1.obj2 = obj2
//
//
//                    // Add pet
//                    let pet = Pet(context: self.updateContext)
//                    pet.name = "Kuku bird"
//                    pet.age = 10
//                    pet.obj1 = obj1
//                    people.pet = pet
//
//
//                    // Add car
//
//                    // Car 1
//                    let alarm1 = AlarmSystem(context: self.updateContext)
//                    alarm1.hasGpsTracking = true
//                    alarm1.hasCentreLocking = false
//                    alarm1.price = 1000
//
//                    let car1 = Car(context: self.updateContext)
//                    car1.carPlat = "ABC123"
//                    car1.alarm = alarm1
//
//
//                    // Car 2
//                    let alarm2 = AlarmSystem(context: self.updateContext)
//                    alarm2.hasGpsTracking = false
//                    alarm2.hasCentreLocking = true
//                    alarm2.price = 2000
//
//                    let car2 = Car(context: self.updateContext)
//                    car2.carPlat = "JJJ3456"
//                    car2.alarm = alarm2
//
//
//                    // Car 3
//                    let alarm3 = AlarmSystem(context: self.updateContext)
//                    alarm3.hasGpsTracking = true
//                    alarm3.hasCentreLocking = true
//                    alarm3.price = 3000
//
//                    let car3 = Car(context: self.updateContext)
//                    car3.carPlat = "XCA303"
//                    car3.alarm = alarm3
//
//                    // Add cars
//                    people.addToCar(car1)
//                    people.addToCar(car2)
//                    people.addToCar(car3)
//
//                    do {
//                        try self.updateContext.save()
//                    } catch {
//                        assertionFailure("Fail to add people")
//                    }
//
//                }
//
//                completion()
//
//            } catch {
//                print("Fetch error: \(error)")
//
//                completion()
//            }
//        }
//    }
}
