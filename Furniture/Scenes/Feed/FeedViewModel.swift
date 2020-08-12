//
//  FeedViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

final class FeedViewModel {
  struct Dependencies {
    var storeService: StoreService = StoreServiceAdapter.shared
  }
  let dependencies: Dependencies
  
  private lazy var sections: [FeedSection] = {
    let stores = self.dependencies.storeService.getStores()
    return [
      BannerSection(name: nil, bannerItems: [
        BannerItem(title: "Build awesome living rooms", subtitle: "Book an appointment with our experts now!", imageName: "Banner0"),
        BannerItem(title: "A design for everybody", subtitle: "Your expectations will be met", imageName: "Banner1"),
        BannerItem(title: "Professional work place", subtitle: "Want to mount an office, count us in!", imageName: "Banner2"),
        BannerItem(title: "Build your own experience", subtitle: "Hard-working, relaxing, open, private, you name it!", imageName: "Banner3"),
        BannerItem(title: "Rugs or hardwood floor", subtitle: "Whatever surface you want we have it", imageName: "Banner4"),
      ]),
      StoreSection(name: "Our Best Stores", storeItems: stores.map { StoreItem(title: $0.name, imageName: $0.imageName, subtitle: $0.address) }),
      FeaturedProductSection(name: "Featured Products", featuredItems: [
        FeaturedProductItem(title: "Dinning Room", imageName: "diningRoom", subtitle: "Stunning dining table and chairs"),
        FeaturedProductItem(title: "Kitchen Tools", imageName: "kitchenTools", subtitle: "Must-have set of kitchen tools"),
        FeaturedProductItem(title: "Living Room", imageName: "livingRoom", subtitle: "Everything you need for a living room, no matter the place!"),
        FeaturedProductItem(title: "Moving Tools", imageName: "movingTools", subtitle: "Make sure to buy these before moving to your new home!"),
        FeaturedProductItem(title: "Power Drill", imageName: "powerDrill", subtitle: "Save yourself a lot of effort"),
        FeaturedProductItem(title: "Table decorations", imageName: "tableDecoration", subtitle: "Perfect for the center of the table"),
        FeaturedProductItem(title: "Tool box", imageName: "toolBox", subtitle: "For every do-it-yourself person"),
        FeaturedProductItem(title: "Wicker furniture", imageName: "wicker", subtitle: "Wicker is what your patio needs")
      ]),
      OptionSection(name: "Quick Links", optionItems: [
        OptionItem(title: "About Funiture Aeki", systemImageName: "info"),
        OptionItem(title: "Share Aeki with your friends", systemImageName: "square.and.arrow.up.fill"),
        OptionItem(title: "News", systemImageName: "book.circle"),
        OptionItem(title: "Privacy Policy", systemImageName: "lock.icloud"),
        OptionItem(title: "Contact Us", systemImageName: "person.crop.circle.fill")
      ])
    ]
  }()
  
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func getSections() -> [FeedSection] {
    return sections
  }
}
