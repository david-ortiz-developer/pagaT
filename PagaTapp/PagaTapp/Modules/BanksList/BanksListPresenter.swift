//
//  BanksListPresenter.swift
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
class BanksListPresenter: BanksListPresenterProtocol {
    func listBanks() {
        self.interactor?.loadBanks { result in
            if let banks = result {
                
            }
                
        }
    }
    
    var interactor: BanksListInteractorProtocol?
    var router: BanksListRouterProtocol?
    var view: BanksListViewControllerProtocol?
}
