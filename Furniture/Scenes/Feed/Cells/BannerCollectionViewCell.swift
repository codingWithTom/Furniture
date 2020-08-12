//
//  BannerCollectionViewCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var bannerImageView: UIImageView!
  
  func configure(with banner: BannerItem) {
    titleLabel.text = banner.title
    subtitleLabel.text = banner.subtitle
    bannerImageView.image = UIImage(named: banner.imageName)
  }

}
