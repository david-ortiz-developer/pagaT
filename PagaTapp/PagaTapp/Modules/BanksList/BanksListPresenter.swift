//
//  BanksListPresenter.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import UIKit
class BanksListPresenter: BanksListPresenterProtocol {
    var interactor: BanksListInteractorProtocol?
    var router: BanksListRouterProtocol?
    var view: BanksListViewControllerProtocol?
    var banks: BankObjects?
    
    func listBanks() {
        self.view?.showLoader()
        self.interactor?.loadBanks { result in
            if let banks = result {
                self.banks = banks
                DispatchQueue.main.async {
                    self.view?.reloadTable()
                }
            }
            self.view?.hideLoader()
        }
    }
}
