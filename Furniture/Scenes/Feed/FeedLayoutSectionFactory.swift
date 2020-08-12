//
//  FeedLayoutSectionFactory.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

struct FeedLayoutSectionFactory: FeedSectionVisitor {
  
  private var header:NSCollectionLayoutBoundarySupplementaryItem {
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
    return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: FeedConstants.headerKind, alignment: .top)
  }
  
  func visit(banner: BannerSection, data: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
    let isRegularWidth = data.traitCollection.horizontalSizeClass == .regular
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(isRegularWidth ? 0.35 : 0.9), heightDimension: .estimated(300))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.interGroupSpacing = isRegularWidth ? 24.0 : 8.0
    return section
  }
  
  func visit(store: StoreSection, data: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
    let isRegularWidth = data.traitCollection.horizontalSizeClass == .regular
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(isRegularWidth ? 0.35 : 0.9), heightDimension: .estimated(250))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.boundarySupplementaryItems = [header]
    section.interGroupSpacing = 8.0
    return section
  }
  
  func visit(product: FeaturedProductSection, data: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
    let isRegularWidth = data.traitCollection.horizontalSizeClass == .regular
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(isRegularWidth ? 0.175 : 0.45), heightDimension: .estimated(275))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.boundarySupplementaryItems = [header]
    section.interGroupSpacing = isRegularWidth ? 24.0 : 8.0
    return section
  }
  
  func visit(option: OptionSection, data: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
    let isRegularWidth = data.traitCollection.horizontalSizeClass == .regular
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(isRegularWidth ? 0.5 : 1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: isRegularWidth ? 2 : 1)
    let section = NSCollectionLayoutSection(group: group)
    section.boundarySupplementaryItems = [header]
    return section
  }
}
