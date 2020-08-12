//
//  FeedCollectionViewCellFactory.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import UIKit

struct FeedCollectionViewCellFactory: FeedItemVisitor {
  let indexPath: IndexPath
  let collectionView: UICollectionView
  
  func visit(banner: BannerItem) -> UICollectionViewCell {
    let identifier = String(describing: BannerCollectionViewCell.self)
    guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BannerCollectionViewCell else {
      return UICollectionViewCell()
    }
    bannerCell.configure(with: banner)
    return bannerCell
  }
  
  func visit(store: StoreItem) -> UICollectionViewCell {
    let identifier = String(describing: StoreCollectionViewCell.self)
    guard let storeCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? StoreCollectionViewCell else {
      return UICollectionViewCell()
    }
    storeCell.configure(with: store)
    return storeCell
  }
  
  func visit(product: FeaturedProductItem) -> UICollectionViewCell {
    let identifier = String(describing: FeatureProductCollectionViewCell.self)
    guard let featuredProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? FeatureProductCollectionViewCell else {
      return UICollectionViewCell()
    }
    featuredProductCell.configure(with: product)
    return featuredProductCell
  }
  
  func visit(option: OptionItem) -> UICollectionViewCell {
    let identifier = String(describing: OptionCollectionViewCell.self)
    guard let optionCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? OptionCollectionViewCell else {
      return UICollectionViewCell()
    }
    optionCell.configure(with: option)
    return optionCell
  }
}
