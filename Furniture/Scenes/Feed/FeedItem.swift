//
//  FeedItem.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol FeedSection {
  var name: String? { get }
  var items: [FeedItem] { get }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome
}

protocol FeedItem  {
  func accept<V: FeedItemVisitor>(visitor: V) -> V.Outcome
}

struct BannerSection: FeedSection {
  let name: String?
  let bannerItems: [BannerItem]
  var items: [FeedItem] { return bannerItems }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(banner: self, data: data)
  }
}

struct BannerItem: FeedItem {
  let title: String
  let subtitle: String
  let imageName: String
  
  func accept<V: FeedItemVisitor>(visitor: V) -> V.Outcome {
    return visitor.visit(banner: self)
  }
}

struct StoreSection: FeedSection {
  let name: String?
  let storeItems: [StoreItem]
  var items: [FeedItem] { return storeItems }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(store: self, data: data)
  }
}

struct StoreItem: FeedItem {
  let title: String
  let imageName: String
  let subtitle: String
  
  func accept<V: FeedItemVisitor>(visitor: V) -> V.Outcome {
    return visitor.visit(store: self)
  }
}

struct FeaturedProductSection: FeedSection {
  let name: String?
  let featuredItems: [FeaturedProductItem]
  var items: [FeedItem] { return featuredItems }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(product: self, data: data)
  }
}

struct FeaturedProductItem: FeedItem {
  let title: String
  let imageName: String
  let subtitle: String
  
  func accept<V: FeedItemVisitor>(visitor: V) -> V.Outcome {
    return visitor.visit(product: self)
  }
}

struct OptionSection: FeedSection {
  let name: String?
  let optionItems: [OptionItem]
  var items: [FeedItem] { return optionItems }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(option: self, data: data)
  }
}

struct OptionItem: FeedItem {
  let title: String
  let systemImageName: String
  
  func accept<V: FeedItemVisitor>(visitor: V) -> V.Outcome {
    return visitor.visit(option: self)
  }
}
