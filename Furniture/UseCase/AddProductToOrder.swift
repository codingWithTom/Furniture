//
//  AddProductToOrder.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-19.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol AddProductToOrder {
  func execute(product: Product)
}

final class AddProductToOrderAdapter: AddProductToOrder {
  struct Dependencies {
    var productService: ProductService = ProductServiceAdapter()
    var orderService: OrderService = OrderServiceAdapter.shared
  }
  let dependencies: Dependencies
  
  init (dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute(product: Product) {
    var order = dependencies.orderService.getOrder()
    add(product: product, to: &order)
    dependencies.orderService.saveOrder(order: order)
  }
}

private extension AddProductToOrderAdapter {
  func add(product: Product, to order: inout Order) {
    if let index = order.products.firstIndex(where: { $0.product.id == product.id }) {
      var orderProduct = order.products.remove(at: index)
      orderProduct.quantity += 1
      order.products.insert(orderProduct, at: index)
    } else {
      order.products.append(OrderProduct(quantity: 1, product: product))
    }
  }
}
