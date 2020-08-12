//
//  OptionCollectionViewCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var optionImageView: UIImageView!
  
  func configure(with option: OptionItem) {
    titleLabel.text = option.title
    optionImageView.image = UIImage(systemName: option.systemImageName)
  }
}
