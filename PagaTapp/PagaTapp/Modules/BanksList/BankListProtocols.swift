//
//  BankListProtocols.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import Foundation
protocol BanksListPresenterProtocol {
    var view: BanksListViewControllerProtocol? {get set}
    var router: BanksListRouterProtocol? {get set}
    var interactor: BanksListInteractorProtocol? {get set}
    
    func listBanks()
}
protocol BanksListViewControllerProtocol {
    var presenter: BanksListPresenterProtocol? {get set}
}
protocol BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol? {get set}
    func loadBanks(completion: @escaping ([BankObject]?) -> Void)
}
protocol BanksListRouterProtocol {
    
}
