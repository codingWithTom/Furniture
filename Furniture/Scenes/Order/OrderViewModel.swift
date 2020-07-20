//
//  OrderViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-09.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

final class OrderViewModel {
  struct Dependencies {
    var orderService: OrderService = OrderServiceAdapter.shared
  }
  let dependecies: Dependencies
  private var order: Order {
    get {
      return dependecies.orderService.getOrder()
    }
    set {
      dependecies.orderService.saveOrder(order: newValue)
    }
  }
  
  init(dependencies: Dependencies = .init()) {
    self.dependecies = dependencies
  }
  
  func getNumberOfProducts() -> Int {
    return order.products.count
  }
  
  func getProductViewModel(for indexPath: IndexPath) -> ProductViewModel {
    let orderProduct = order.products[indexPath.row]
    return ProductViewModel(name: orderProduct.product.name, price: orderProduct.formattedTotal, imageName: orderProduct.product.imageName)
  }
  
  func getProduct(for indexPath: IndexPath) -> Product {
    return order.products[indexPath.row].product
  }
  
  func getTotal() -> String {
    return order.formattedTotal
  }
  
  func deleteProduct(at indexPath: IndexPath) {
    order.products.remove(at: indexPath.row)
  }
  
  func moveProduct(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let movedProduct = order.products.remove(at: sourceIndexPath.row)
    order.products.insert(movedProduct, at: destinationIndexPath.row)
  }
}
