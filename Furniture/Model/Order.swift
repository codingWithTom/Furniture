//
//  Order.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-09.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

struct Order {
  var products: [Product]
  var total: Double {
    return products.reduce(0.0) { $0 + $1.price }
  }
  var formattedTotal: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: total)) ?? "$0.00"
  }
}
