//
//  AddProductViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-19.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

protocol AddProductPresentationUpdateDelegate: class {
  func didDissmisView()
}

class AddProductViewController: UIViewController {
  
  weak var presentationDelegate: AddProductPresentationUpdateDelegate?
  @IBOutlet private weak var productCollectionView: UICollectionView!
  private let viewModel = AddProductViewModel()
  private let productCellIdentifier = "ProductCollectionCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
  }
  
  @IBAction func cancellButtonTapped(_ sender: Any) {
    dismissScene()
  }
}

private extension AddProductViewController {
  func configureCollectionView() {
    productCollectionView.dataSource = self
    productCollectionView.delegate = self
    productCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    productCollectionView.register(UINib(nibName: String(describing: ProductCollectionViewCell.self), bundle: nil),
                                   forCellWithReuseIdentifier: productCellIdentifier)
    
    productCollectionView.reloadData()
  }
  
  func dismissScene() {
    dismiss(animated: true, completion: nil)
    presentationDelegate?.didDissmisView()
  }
}

extension AddProductViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.getNumberOfProducts()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier, for: indexPath) as? ProductCollectionViewCell
    else { return UICollectionViewCell() }
    
    cell.configure(with: viewModel.getViewModel(for: indexPath))
    return cell
  }
}

extension AddProductViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.addProduct(indexPath: indexPath)
    dismissScene()
  }
}

extension AddProductViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.bounds.width * 0.33, height: view.bounds.width * 0.33)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}
