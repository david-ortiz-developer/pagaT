//
//  BanksListPresenter.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import Foundation
class BanksListPresenter: BanksListPresenterProtocol {
    var interactor: BanksListInteractorProtocol?
    var router: BanksListRouterProtocol?
    var view: BanksListViewControllerProtocol?
    var banks: BankObjects?
    
    func listBanks() {
        self.interactor?.loadBanks { result in
            if let banks = result {
                self.banks = banks
                DispatchQueue.main.async {
                    self.view?.reloadTable()
                }
            }
        }
    }
}
