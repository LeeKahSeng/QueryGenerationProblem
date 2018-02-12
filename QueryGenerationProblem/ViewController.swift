//
//  ViewController.swift
//  QueryGenerationProblem
//
//  Created by Lee Kah Seng on 12/02/2018.
//  Copyright © 2018 Lee Kah Seng. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    private let persistentContainer = NSPersistentContainer(name: "QueryGenerationProblem")
    
    private var loopTimer: Timer?
    let loopTimerInterval = 0.3
    
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loopButtonTapped(_ sender: Any) {
        
        loopTimer?.invalidate()
        
        // Start timer
        loopTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(loopTimerInterval), repeats: true, block: { [unowned self] (timer) in
            print("======== \(self.counter) ============")
            
            // 1. Write to core data
            print("Set to core data: \(Date())")
            CoreDataModifier.shared.generateDate {
                
                // 2. Fetch from core data
                var reader: CoreDataReader?
                DispatchQueue.main.sync {
                    reader = CoreDataReader()
                }
                
                // 3. Update core data
                print("Update core data: \(Date())")
                CoreDataModifier.shared.generateDate {
                    
                    DispatchQueue.main.sync {
                        // 4. Read from fetch result
                        print("Core data value: \(String(describing: reader?.obj1?.obj2?.obj3?.obj4?.obj5?.obj6?.now))")
                    }
                    
                    // Increase counter
                    self.counter += 1
                }
            }
        })
        
        loopTimer?.fire()
        
    }
    
}

