//
//  StoreCollectionViewCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var storeImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    storeImageView.layer.cornerRadius = 18.0
  }

  func configure(with store: StoreItem) {
    titleLabel.text = store.title
    subtitleLabel.text = store.subtitle
    storeImageView.image = UIImage(named: store.imageName)
  }
}
