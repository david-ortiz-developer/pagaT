//
//  BanksListInteractor.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import Foundation
protocol BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol? {get set}
}
class BanksListInteractor: BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol?

}
