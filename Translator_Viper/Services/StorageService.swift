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
    static func fetchData(withPredicate predicateText: String? = nil,
                          resultCallback result: @escaping ([Translate]) -> Void,
                          failureCallback failure: @escaping (Error) -> Void) {
        // init request
        let request: NSFetchRequest<Translate> = Translate.fetchRequest()
        
        // convert searchBar predicate
        if let text = predicateText {
            let originalLangPredicate = NSPredicate(format: "originalString CONTAINS[c] %@ ", text)
            let translatedLandPredicate = NSPredicate(format: "translatedString CONTAINS[c] %@", text)
            let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [originalLangPredicate, translatedLandPredicate])
            request.predicate = predicate
        }
        // fetch request
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
    
    static func saveUserDefaults(firstButton: String, secondButton: String) {
        let firstKey = "first"
        let secondKey = "second"
        UserDefaults.standard.set(firstButton, forKey: firstKey)
        UserDefaults.standard.set(secondButton, forKey: secondKey)
    }
    
    static func fetchUserDefaults() -> [String] {
        let firstKey = "first"
        let secondKey = "second"
        guard let first = UserDefaults.standard.string(forKey: firstKey),
            let second = UserDefaults.standard.string(forKey: secondKey) else { return ["English", "Russian"] }
        return [first, second]
    }
}
