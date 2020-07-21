//
//  AddProductViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-20.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

protocol AddProductViewControllerPresentationDelegate: class {
  func didDismissView()
}

class AddProductViewController: UIViewController {
  
  @IBOutlet private weak var productsCollectionView: UICollectionView!
  private let productCellIdentifier = "ProductCollectionCell"
  private let viewModel = AddProductViewModel()
  weak var presentationDelegate: AddProductViewControllerPresentationDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
  }
  
  @IBAction func cancelActionItem(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}

private extension AddProductViewController {
  func configureCollectionView() {
    productsCollectionView.delegate = self
    productsCollectionView.dataSource = self
    productsCollectionView.register(UINib(nibName: String(describing: ProductCollectionViewCell.self), bundle: nil),
                                    forCellWithReuseIdentifier: productCellIdentifier)
    productsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    productsCollectionView.reloadData()
  }
}

extension AddProductViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.getNumberOfProduct()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier, for: indexPath) as? ProductCollectionViewCell
    else { return UICollectionViewCell()}
    cell.configure(with: viewModel.getViewModel(for: indexPath))
    return cell
  }
}

extension AddProductViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.addProduct(for: indexPath)
    dismiss(animated: true, completion: nil)
    presentationDelegate?.didDismissView()
  }
}

extension AddProductViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellSize = view.bounds.width * 0.33
    return CGSize(width: cellSize, height: cellSize)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}
