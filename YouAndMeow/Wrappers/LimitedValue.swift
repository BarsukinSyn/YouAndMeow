//
//  LimitedValue.swift
//  YouAndMeow
//
//  Created by Vladimir on 06.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

@propertyWrapper
struct LimitedValue<T: Comparable> {
  let limit: ClosedRange<T>

  private var currentValue: T!

  var wrappedValue: T {
    get { self.currentValue }
    set { self.currentValue = newValue.clamped(self.limit) }
  }

  init(wrappedValue: T, limit: ClosedRange<T>) {
    self.limit = limit
    self.wrappedValue = wrappedValue
  }

  init(wrappedValue: T, _ limit: ClosedRange<T>) {
    self.init(wrappedValue: wrappedValue, limit: limit)
  }
}
