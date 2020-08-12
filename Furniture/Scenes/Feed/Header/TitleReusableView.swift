//
//  TitleReusableView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class TitleReusableView: UICollectionReusableView {
  
  @IBOutlet private weak var titleLabel: UILabel!
  
  func configure(with title: String) {
    titleLabel.text = title
  }
}
