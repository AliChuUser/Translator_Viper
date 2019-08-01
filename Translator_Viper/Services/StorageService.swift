//
//  StorageService.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation
import UIKit
import CoreData

private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class StorageService {
    
    // fetch data from CoreData
    static func fetchData(with predicate: NSPredicate? = nil,
                          resultCallback result: @escaping ([Translate]) -> Void,
                          failureCallback failure: @escaping (Error) -> Void) {
        
        let request: NSFetchRequest<Translate> = Translate.fetchRequest()
        if let predicate = predicate {
            request.predicate = predicate
        }
        do {
            let objects = try context.fetch(request)
            result(objects)
        } catch let error {
            print("Failure Callback --> ")
            failure(error)
        }
    }
    
    // save data to CoreData
    static func saveData(originalString: String, translatedString: String) {
        let entity = NSEntityDescription.entity(forEntityName: "Translate", in: context)
        let translate = NSManagedObject(entity: entity!, insertInto: context)
        translate.setValue(originalString, forKey: "originalString")
        translate.setValue(translatedString, forKey: "translatedString")
        print("Data saved in coreData")
        saveContext()
    }
    
    // delete object from CoreData
    static func delete(object: Translate) {
        context.delete(object)
        print("Data deleted form CoreData")
        saveContext()
    }
    
    // delete all data from CoreData
    static func deleteAllData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Translate")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            print("All data deleted")
        } catch let error {
            print("Cannot delete all data from CoreData: \(error.localizedDescription)")
        }
        saveContext()
    }
    
    // save method
    static func saveContext() {
        do {
            try context.save()
        } catch let error {
            print("Cannot save data to CoreData: \(error.localizedDescription)")
        }
    }
}
