//
//  ProductService.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-09.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol ProductService {
  func getProducts() -> [Product]
}

final class ProductServiceAdapter: ProductService {
  static let shared = ProductServiceAdapter()
  private var loremIpsum: String {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  }
  private lazy var products = [
    Product(name: "Bench", price: 20.5, imageName: "bench", description: loremIpsum),
    Product(name: "Coffee Table", price: 40.0, imageName: "coffeeTable", description: loremIpsum),
    Product(name: "Dinning Table", price: 55.0, imageName: "dinningTable", description: loremIpsum),
    Product(name: "Director Chair", price: 75.0, imageName: "directorChair", description: loremIpsum),
    Product(name: "Orange Chair", price: 33.95, imageName: "orangeChair", description: loremIpsum),
    Product(name: "Small Wooden Table", price: 47.5, imageName: "smallWooden", description: loremIpsum),
    Product(name: "White Chair", price: 20.0, imageName: "whiteChair", description: loremIpsum),
    Product(name: "White Table", price: 54.0, imageName: "whiteTable", description: loremIpsum),
    Product(name: "Wooden Chair", price: 65.0, imageName: "woodenChair", description: loremIpsum),
    Product(name: "Wooden Table", price: 63.0, imageName: "woodenTable", description: loremIpsum),
    Product(name: "Yellow Chair", price: 80.0, imageName: "yellowChair", description: loremIpsum)
  ]
  
  private init() { }
  
  
  func getProducts() -> [Product] {
    return products
  }
}
