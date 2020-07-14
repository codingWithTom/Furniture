//
//  OrderViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-09.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

final class OrderViewModel {
  var order = Order(products: [])
  private var productService: ProductService = ProductServiceAdapter()
  private lazy var products: [Product] = {
    return self.productService.getProducts()
  }()
  
  func addProduct() {
    guard let newProduct = products.randomElement() else { return }
    order.products.append(newProduct)
  }
  
  func getNumberOfProducts() -> Int {
    return order.products.count
  }
  
  func getProductViewModel(for indexPath: IndexPath) -> ProductViewModel {
    let product = order.products[indexPath.row]
    return ProductViewModel(name: product.name, price: product.formattedPrice, imageName: product.imageName)
  }
  
  func getProduct(for indexPath: IndexPath) -> Product {
    return order.products[indexPath.row]
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
