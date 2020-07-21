//
//  AddProductViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-20.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import AVFoundation

final class AddProductViewModel {
  struct Dependencies {
    var addProduct: AddProduct = AddProductAdapter()
    var productService: ProductService = ProductServiceAdapter.shared
  }
  let dependencies: Dependencies
  private var player: AVPlayer?
  
  private lazy var products: [Product] = {
    return self.dependencies.productService.getProducts()
  }()
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func getNumberOfProduct() -> Int {
    return products.count
  }
  
  func addProduct(for indexPath: IndexPath) {
    let product = products[indexPath.row]
    playSound()
    dependencies.addProduct.execute(product: product)
  }
  
  func getViewModel(for indexPath: IndexPath) -> ProductCellViewModel {
    let product = products[indexPath.row]
    return ProductCellViewModel(name: product.name, imageName: product.imageName)
  }
}

private extension AddProductViewModel {
  func playSound() {
    guard let url = Bundle.main.url(forResource: "TapSound", withExtension: "mp3") else { return }
    player = AVPlayer(url: url)
    player?.play()
  }
}
