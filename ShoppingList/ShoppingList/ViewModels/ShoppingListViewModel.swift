//
//  ShoppingListViewModel.swift
//  ShoppingList
//
//  Created by Павел Гришутенко on 16.11.2021.
//

import Foundation
import UIKit

class ShoppingListViewModel: ShoppingListViewModelProtocol {
  private var products: [ShoppingListModel]?
  
  var productList: [String]? = [] {
    didSet {
      shoppingListDidChange?(self)
    }
  }
  
  var navigationTitle: String? {
    return "Shopping List"
  }
  
  var addButtonTitle: String? {
    return "add"
  }
  
  var shoppingListDidChange: ((ShoppingListViewModelProtocol) -> Void)?
  
  var counter: Int = 0
  @objc func addNewProduct(){
    productList?.append("product \(counter)")
    counter += 1
  }
}

