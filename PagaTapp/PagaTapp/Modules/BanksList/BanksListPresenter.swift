//
//  BanksListPresenter.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import Foundation
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
