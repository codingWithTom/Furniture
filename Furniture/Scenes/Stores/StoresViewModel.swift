//
//  StoresViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-27.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

class StoreAnnotationViewModel: NSObject {
  let name: String
  let address: String
  let isOpen: Bool
  let latitude: Double
  let longitude: Double
  
  init(name: String, address: String, isOpen: Bool, latitude: Double, longitude: Double) {
    self.name = name
    self.address = address
    self.isOpen = isOpen
    self.latitude = latitude
    self.longitude = longitude
  }
}

final class StoresViewModel {
  struct Dependencies {
    var storeService: StoreService = StoreServiceAdapter.shared
    var applicationService: ApplicationService = ApplicationServiceAdapter()
  }
  let dependencies: Dependencies
  
  private lazy var stores: [StoreAnnotationViewModel] = {
    return dependencies.storeService.getStores().map {
      StoreAnnotationViewModel(name: $0.name, address: $0.address, isOpen: $0.isOpen,
                               latitude: $0.lat, longitude: $0.lon)
    }
  }()
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func getStores() -> [StoreAnnotationViewModel] {
    return stores
  }
  
  func tappedCallout(on annotation: StoreAnnotationViewModel) {
    if annotation.isOpen {
      dependencies.applicationService.call(phoneNumber: "1111111111")
    } else {
      dependencies.applicationService.go(to: "https://apple.com")
    }
  }
}
