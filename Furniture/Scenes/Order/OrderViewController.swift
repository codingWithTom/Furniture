//
//  OrderViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-09.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
  
  @IBOutlet private weak var orderTableView: UITableView!
  private let viewModel = OrderViewModel()
  private let productTableViewCellIdentifier = "ProductCellIdentifier"
  private let productDetailVCIdentifier = "ProductDetailNavigation"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    updateTitle()
  }
  
  @IBAction func addProduct(_ sender: Any) {
    viewModel.addProduct()
    updateTitle()
    orderTableView.reloadData()
  }
  
  @IBAction func toggleEdit(_ sender: Any) {
    orderTableView.setEditing(!orderTableView.isEditing, animated: true)
  }
}

private extension OrderViewController {
  func configureTableView() {
    orderTableView.delegate = self
    orderTableView.dataSource = self
    orderTableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil),
                            forCellReuseIdentifier: productTableViewCellIdentifier)
    orderTableView.reloadData()
  }
  
  func updateTitle() {
    let total = viewModel.getTotal()
    title = total
  }
}

extension OrderViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = storyboard?.instantiateViewController(identifier: productDetailVCIdentifier)
    guard
      let navigationViewController = viewController as? UINavigationController,
      let detailViewController = navigationViewController.viewControllers.first as? ProductDetailViewController
    else { return }
    detailViewController.configure(with: viewModel.getProduct(for: indexPath))
    showDetailViewController(navigationViewController, sender: self)
  }
}

extension OrderViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getNumberOfProducts()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: productTableViewCellIdentifier) as? ProductTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(with: viewModel.getProductViewModel(for: indexPath))
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete else { return }
    viewModel.deleteProduct(at: indexPath)
    orderTableView.deleteRows(at: [indexPath], with: .automatic)
    updateTitle()
  }
  
  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    viewModel.moveProduct(from: sourceIndexPath, to: destinationIndexPath)
  }
}
