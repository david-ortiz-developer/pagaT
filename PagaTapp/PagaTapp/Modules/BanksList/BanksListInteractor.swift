//
//  BanksListInteractor.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import Foundation
protocol BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol? {get set}
    func loadBanks(completion: @escaping ([BankObject]?) -> Void)
}
class BanksListInteractor: BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol?
     func loadBanks(
                          completion: @escaping ([BankObject]?) -> Void) {
        if let url = URL(string: "https://dev.obtenmas.com/catom/api/challenge/banks") {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil)
                }
                
                if let jsonData = data {
                    let blogPost: BankObjects = try! JSONDecoder().decode(BankObjects.self, from: jsonData)
                    completion(blogPost)
                }
            }
            
            urlSession.resume()
        }
    }

}
