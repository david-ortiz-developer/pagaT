//
//  BankObject.swift
//  PagaTapp
//
//  Created by edgar david ortiz diaz on 22/10/22.
//

import Foundation
struct BankObject: Decodable {
    var bankName: String
    var description: String
    var age: Int
    var url: String
}
typealias BankObjects = [BankObject]
