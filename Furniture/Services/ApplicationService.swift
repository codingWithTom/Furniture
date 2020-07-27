//
//  ApplicationService.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-27.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit

protocol ApplicationService {
  func call(phoneNumber: String)
  func go(to: String)
}

final class ApplicationServiceAdapter: ApplicationService {
  func call(phoneNumber: String) {
    guard let callURL = URL(string: "tel://\(phoneNumber)") else { return }
    UIApplication.shared.open(callURL, options: [:], completionHandler: nil)
  }
  
  func go(to website: String) {
    guard let webSiteUrl = URL(string: website) else { return }
    UIApplication.shared.open(webSiteUrl, options: [:], completionHandler: nil)
  }
}
