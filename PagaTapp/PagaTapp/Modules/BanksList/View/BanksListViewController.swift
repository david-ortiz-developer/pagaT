//
//  BanksListViewController.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import UIKit
class BanksListViewController: UIViewController, BanksListViewControllerProtocol {
    
    var presenter: BanksListPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Banks List"
        self.presenter?.listBanks()
        // Do any additional setup after loading the view.
    }

    func reloadTable() {
        self.tableView.reloadData()
    }

}
extension BanksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.banks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let bankInfo = self.presenter?.banks?[indexPath.row] {
            cell.textLabel?.text  = bankInfo.bankName
        }
        return cell
    }
}
