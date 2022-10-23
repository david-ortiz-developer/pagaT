//
//  BanksListInteractor.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import UIKit
import CoreData
class BanksListInteractor: BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol?
    var savedBanks: [NSManagedObject] = []
    
     func loadBanks(completion: @escaping ([BankObject]?) -> Void) {
         let savedBanks = self.loadFromDisk()
         if savedBanks?.isEmpty == false {
             completion(savedBanks)
         } else {
             self.loadFromServer { banks  in
                 completion(banks)
             }
         }
       
    }
    func save(banks: BankObjects) {
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
        let entity =
          NSEntityDescription.entity(forEntityName: "BankEntity",
                                     in: managedContext)!
        for bank in banks {
            let bankForSaving = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
            bankForSaving.setValue(bank.bankName, forKeyPath: "bankName")
            bankForSaving.setValue(bank.age, forKeyPath: "bankAge")
            bankForSaving.setValue(bank.description, forKeyPath: "bankDescription")
            bankForSaving.setValue(bank.url, forKeyPath: "bankUrl")
            do {
              try managedContext.save()
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
        }

    }
    func loadFromServer(completion: @escaping ([BankObject]?) -> Void) {
        if let url = URL(string: "https://dev.obtenmas.com/catom/api/challenge/banks") {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let _ = error {
                    completion(nil)
                }
                if let jsonData = data {
                    let banksList: BankObjects = try! JSONDecoder().decode(BankObjects.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.save(banks: banksList)
                    }
                   
                    completion(banksList)
                }
            }
            
            urlSession.resume()
        }
    }
    func loadFromDisk() -> [BankObject]? {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return nil
          }
          
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "BankEntity")
          
          do {
            let list = try managedContext.fetch(fetchRequest)
              var returnArray = [BankObject]()
              for item in list {
                  returnArray.append(
                    BankObject(
                        bankName: item.value(forKey: "bankName") as! String,
                        description: item.value(forKey: "bankDescription") as! String,
                        age: item.value(forKey: "bankAge") as! Int,
                        url: item.value(forKey: "bankUrl") as! String)
                  )
              }
            return returnArray
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
              return nil
          }
    }
}
