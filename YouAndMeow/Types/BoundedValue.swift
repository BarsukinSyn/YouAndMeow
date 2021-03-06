//
//  BoundedValue.swift
//  YouAndMeow
//

import Foundation

struct BoundedValue<T: Numeric & Comparable> {
  let bounds: ClosedRange<T>

  private var currentValue: T!

  var value: T {
    get { self.currentValue }
    set { self.currentValue = newValue.clamped(self.bounds) }
  }

  init(_ initialValue: T, bounds: ClosedRange<T>) {
    self.bounds = bounds
    self.value = initialValue
  }
}
