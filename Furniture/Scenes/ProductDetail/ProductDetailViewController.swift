//
//  ProductDetailViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-13.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
  private let viewModel = ProductDetailViewModel()
  @IBOutlet private weak var productImageView: UIImageView!
  @IBOutlet private weak var descriptionTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    productImageView.image = UIImage(named: viewModel.imageName)
    descriptionTextView.text = viewModel.description
    title = viewModel.name
  }
  
  func configure(with product: Product) {
    viewModel.configure(with: product)
  }
}
