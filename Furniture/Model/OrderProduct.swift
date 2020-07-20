//
//  OrderProduct.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-19.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

struct OrderProduct {
  var quantity: Int
  let product: Product
  
  var total: Double {
    return product.price * Double(quantity)
  }
  var formattedTotal: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: total)) ?? "$0.00"
  }
}
