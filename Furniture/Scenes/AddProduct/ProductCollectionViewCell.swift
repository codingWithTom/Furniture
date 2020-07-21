//
//  ProductCollectionViewCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-20.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

struct ProductCellViewModel {
  let name: String
  let imageName: String
}

class ProductCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private weak var productImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    productImageView.layer.cornerRadius = 8.0
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    productImageView.image = nil
    nameLabel.text = nil
  }
  
  func configure(with viewModel: ProductCellViewModel) {
    productImageView.image = UIImage(named: viewModel.imageName)
    nameLabel.text = viewModel.name
  }
}
