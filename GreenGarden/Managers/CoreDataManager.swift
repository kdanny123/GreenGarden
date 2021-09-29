//
//  CoreDataManager.swift
//  GreenGarden
//
//  Created by Admin on 9/28/21.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "GreenGardenModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("failed to initialize core data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext //actual thing that allows us to perform the request to save, etc.
    }
    
    var backgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    func save() throws {
        do { try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    func importData() async throws {
        
        func removeAllData() {
            let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Vegetable")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            
            do {
                try viewContext.execute(deleteRequest)
            } catch {
                print(error)
            }

        }
        
        let vegetableDTOs = try await Webservice().getAllVegetables(url: Constants.Urls.getAllVegetables)
            //remove existing data
        removeAllData()
        
        //insert data
        
        for vegetableDTO in vegetableDTOs {
            try await backgroundContext.perform {
                let vegetable = Vegetable(context: self.viewContext)
                vegetable.vegetableID = Int32(vegetableDTO.vegetableId)
                vegetable.growingDescription = vegetableDTO.growingDescription
                vegetable.sowingDescription = vegetableDTO.sowingDescription
                vegetable.growingSoilTemperature = vegetableDTO.growingSoilTemp
                vegetable.seedDepth = vegetableDTO.seedDepth
                vegetable.thumbnailImage = vegetableDTO.thumbnailImage
                try self.save()
            }
        }
    }
    
}
