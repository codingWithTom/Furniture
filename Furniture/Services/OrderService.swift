//
//  OrderService.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-20.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol OrderService {
  func getOrder() -> Order
  func save(order: Order)
}

final class OrderServiceAdapter: OrderService {
  static let shared = OrderServiceAdapter()
  private var order = Order(products: [])
  
  private init() {}
  
  func getOrder() -> Order {
    return order
  }
  
  func save(order: Order) {
    self.order = order
  }
}
