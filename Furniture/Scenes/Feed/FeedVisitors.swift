//
//  FeedVisitors.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-11.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol FeedSectionVisitor {
  associatedtype Outcome
  associatedtype Data
  
  func visit(banner: BannerSection, data: Data) -> Outcome
  func visit(store: StoreSection, data: Data) -> Outcome
  func visit(product: FeaturedProductSection, data: Data) -> Outcome
  func visit(option: OptionSection, data: Data) -> Outcome
}

protocol FeedItemVisitor {
  associatedtype Outcome
  
  func visit(banner: BannerItem) -> Outcome
  func visit(store: StoreItem) -> Outcome
  func visit(product: FeaturedProductItem) -> Outcome
  func visit(option: OptionItem) -> Outcome
}
