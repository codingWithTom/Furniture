//
//  SplitViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-13.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
  }
}

extension SplitViewController: UISplitViewControllerDelegate {
  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
    return true
  }
}
