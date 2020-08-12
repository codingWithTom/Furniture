//
//  FeedViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

struct FeedConstants {
  static let headerKind = "Title header king"
}

class FeedViewController: UIViewController {
  
  @IBOutlet private weak var feedCollectionView: UICollectionView!
  private let viewModel = FeedViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollection()
  }
}

private extension FeedViewController {
  func configureCollection() {
    feedCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: BannerCollectionViewCell.self))
    feedCollectionView.register(UINib(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: StoreCollectionViewCell.self))
    feedCollectionView.register(UINib(nibName: "FeatureProductCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: String(describing: FeatureProductCollectionViewCell.self))
    feedCollectionView.register(UINib(nibName: "OptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: OptionCollectionViewCell.self))
    feedCollectionView.register(UINib(nibName: "TitleReusableView", bundle: nil),
                                forSupplementaryViewOfKind: FeedConstants.headerKind, withReuseIdentifier: String(describing: TitleReusableView.self))
    feedCollectionView.dataSource = self
    let factory = FeedLayoutSectionFactory()
    let compositionalLayout = UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
      let feedSection = self.viewModel.getSections()[section]
      return feedSection.accept(visitor: factory, data: environment)
    }
    feedCollectionView.collectionViewLayout = compositionalLayout
    feedCollectionView.reloadData()
  }
}

extension FeedViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel.getSections().count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.getSections()[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = viewModel.getSections()[indexPath.section].items[indexPath.row]
    let factory = FeedCollectionViewCellFactory(indexPath: indexPath, collectionView: collectionView)
    return item.accept(visitor: factory)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard let titleView = collectionView.dequeueReusableSupplementaryView(ofKind: FeedConstants.headerKind,
                                                                          withReuseIdentifier: String(describing: TitleReusableView.self),
                                                                          for: indexPath) as? TitleReusableView
      else {
        return UICollectionReusableView()
    }
    titleView.configure(with: viewModel.getSections()[indexPath.section].name ?? "")
    return titleView
  }
}
