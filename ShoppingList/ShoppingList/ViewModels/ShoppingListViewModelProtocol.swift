//
//  ShoppingListViewModelProtocol.swift
//  ShoppingList
//
//  Created by Павел Гришутенко on 16.11.2021.
//

import Foundation

@objc
protocol ShoppingListViewModelProtocol {
  var navigationTitle: String? { get }
  var addButtonTitle: String? { get }
  var productList: [String]? { get }
  var shoppingListDidChange: ((ShoppingListViewModelProtocol) -> Void)? { get set }
  
  //actions
  func addNewProduct()
}
