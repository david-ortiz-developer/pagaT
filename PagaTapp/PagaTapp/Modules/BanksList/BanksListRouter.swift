//
//  BanksListRouter.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import UIKit

class BanksListRouter: BanksListRouterProtocol {
    static func createBanksListView() -> BanksListViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "BanksListView") as! BanksListViewController
        let presenter = BanksListPresenter()
        let interactor = BanksListInteractor()
        let router = BanksListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    static var mainstoryboard: UIStoryboard{
            return UIStoryboard(name:"BanksListViewController",bundle: Bundle.main)
        }
}
