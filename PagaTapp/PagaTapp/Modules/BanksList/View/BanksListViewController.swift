//
//  BanksListViewController.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import UIKit
class BanksListViewController: UIViewController, BanksListViewControllerProtocol {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIView!
    
    var presenter: BanksListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.presenter?.listBanks()
    }
    func configureUI(){
        self.title = "Banks List"
        self.tableView.layer.cornerRadius = 10.0
        self.tableView.layer.shadowColor = UIColor.gray.cgColor
        self.tableView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.tableView.layer.shadowOpacity = 0.4
        self.tableView.layer.shadowRadius = 5.0
        self.tableView.clipsToBounds = true
        self.tableView.layer.masksToBounds = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
    }
    func reloadTable() {
        self.tableView.reloadData()
    }
    func showLoader() {
        self.loader.isHidden = false
    }
    
    func hideLoader() {
        self.loader.isHidden = true
    }
    
}
extension BanksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.banks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bankCell", for: indexPath) as? BanksTableViewCell,
           let bankInfo = self.presenter?.banks?[indexPath.row] {
            cell.nameLabel.text = bankInfo.bankName
            cell.descriptionLabel.text = bankInfo.description
            cell.yearsLabel.text = "\(bankInfo.age) años"
            let url = URL(string: bankInfo.url)
            let data = try? Data(contentsOf: url!) 
            cell.bankImage.image = UIImage(data: data!)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
extension BanksListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let bankInfo = self.presenter?.banks?[indexPath.row],
           let url = URL(string: bankInfo.url) {
            UIApplication.shared.open(url)
        }
    }
}
