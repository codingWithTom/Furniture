//
//  TabBarViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-27.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
  
  private var previouslySelectedIndex = 0
  private lazy var animatedController = TabBarControllerAnimatedTransitioning(screenWidth: view.bounds.width)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
}

extension TabBarViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    let slideFromLeft = previouslySelectedIndex > selectedIndex
    animatedController.isSlidingFromLeft = slideFromLeft
    previouslySelectedIndex = selectedIndex
  }
  
  func tabBarController(_ tabBarController: UITabBarController,
                        animationControllerForTransitionFrom fromVC: UIViewController,
                        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return animatedController
  }
}

private final class TabBarControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
  var isSlidingFromLeft: Bool = false
  let screenWidth: CGFloat
  
  init(screenWidth: CGFloat) {
    self.screenWidth = screenWidth
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let destinationView = transitionContext.view(forKey: .to) else { return }
    destinationView.transform = .init(translationX: isSlidingFromLeft ? -screenWidth : screenWidth, y: 0.0)
    transitionContext.containerView.addSubview(destinationView)
    UIView.animate(withDuration: transitionDuration(using: transitionContext),
                   animations: {
                    destinationView.transform = .identity
    }, completion: { transitionContext.completeTransition($0) })
  }
}
