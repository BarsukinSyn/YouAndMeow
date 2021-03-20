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
  let range: ClosedRange<T>

  private var currentValue: T!

  var wrappedValue: T {
    get { self.currentValue }
    set { self.currentValue = newValue.clamped(self.range) }
  }

  init(wrappedValue: T, range: ClosedRange<T>) {
    self.range = range
    self.wrappedValue = wrappedValue
  }

  init(wrappedValue: T, _ range: ClosedRange<T>) {
    self.init(wrappedValue: wrappedValue, range: range)
  }
}
