//
//  OrderService.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-19.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol OrderService {
  func getOrder() -> Order
  func saveOrder(order: Order)
}

final class OrderServiceAdapter: OrderService {
  
  static let shared = OrderServiceAdapter()
  private var order = Order(products: [])
  
  private init () {}
  
  func getOrder() -> Order {
    return order
  }
  
  func saveOrder(order: Order) {
    self.order = order
  }
  
}
