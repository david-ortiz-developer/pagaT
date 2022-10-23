//
//  BanksListViewController.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import UIKit
protocol BanksListViewControllerProtocol {
    var presenter: BanksListPresenterProtocol? {get set}
}
class BanksListViewController: UIViewController, BanksListViewControllerProtocol {
    var presenter: BanksListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
