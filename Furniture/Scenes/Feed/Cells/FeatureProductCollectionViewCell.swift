//
//  FeatureProductCollectionViewCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class FeatureProductCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var productImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    productImageView.layer.cornerRadius = 8.0
  }
  
  func configure(with product: FeaturedProductItem) {
    titleLabel.text = product.title
    subtitleLabel.text = product.subtitle
    productImageView.image = UIImage(named: product.imageName)
  }
}
