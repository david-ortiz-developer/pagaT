//
//  PagaTappTests.swift
//  PagaTappTests
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import XCTest
@testable import PagaTapp
class FakeInteractor: BanksListInteractorProtocol {
    var presenter: BanksListPresenterProtocol?
    
    func loadBanks(completion: @escaping ([BankObject]?) -> Void) {
        let bank = BankObject(bankName: "David Ortiz Bank", description: "Testing bank for fake interactor", age: 1, url: "www.google.com")
        completion([bank])
    }
    
    
}
class PagaTappTests: XCTestCase {
    var presenter: BanksListPresenterProtocol?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let interactor = FakeInteractor()
        self.presenter = BanksListPresenter()
        self.presenter?.interactor = interactor
        interactor.presenter = self.presenter
    }

    func testPresenter() throws {
        presenter?.listBanks()
        XCTAssert((presenter?.banks?.count ?? 0) > 0)
    }


}
