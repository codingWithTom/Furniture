//
//  ProductDetailViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-13.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

final class ProductDetailViewModel {
  var name: String { return product?.name ?? "No product"}
  var imageName: String { return product?.imageName ?? "" }
  var description: String { return product?.description ?? "" }
  private var product: Product?
  
  func configure(with product: Product) {
    self.product = product
  }
}
