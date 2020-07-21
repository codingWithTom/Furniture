//
//  AddProduct.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-20.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol AddProduct {
  func execute(product: Product)
}

final class AddProductAdapter: AddProduct {
  struct Dependecies {
    var orderService: OrderService = OrderServiceAdapter.shared
  }
  let dependencies: Dependecies
  
  init(dependencies: Dependecies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute(product: Product) {
    var order = dependencies.orderService.getOrder()
    if let index = order.products.firstIndex(where: { $0.product.id == product.id }) {
      var orderProduct = order.products.remove(at: index)
      orderProduct.quantity += 1
      order.products.insert(orderProduct, at: index)
    } else {
      order.products.append(OrderProduct(quantity: 1, product: product))
    }
    dependencies.orderService.save(order: order)
  }
}
