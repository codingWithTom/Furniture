//
//  Product.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-09.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

struct Product {
  let id = UUID()
  let name: String
  let price: Double
  let imageName: String
  let description: String
  
  var formattedPrice: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
  }
}
