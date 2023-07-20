//
//  Persistence.swift
//  AppGame
//
//  Created by Марк Горкій on 19.07.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "ScoreModel")
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    func save(context:NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!!")
        } catch {
            print("Data is NOT saved :(")
        }
    }
    func AddItem( score:Double, context:NSManagedObjectContext) {
       let scor = Score(context: context)
        scor.id = UUID()
        scor.date = Date()
        scor.points = score
        
        save(context:context)
    }

}
