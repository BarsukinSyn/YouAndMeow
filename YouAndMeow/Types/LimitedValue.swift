//
//  LimitedValue.swift
//  YouAndMeow
//
//  Created by Vladimir on 06.07.2020.
//

import Foundation

@propertyWrapper
struct LimitedValue<T: Comparable> {
  let bounds: ClosedRange<T>

  private (set) var currentValue: T!

  var wrappedValue: T {
    get { self.currentValue }
    set { self.currentValue = newValue.clamped(self.bounds) }
  }

  init(wrappedValue: T, bounds: ClosedRange<T>) {
    self.bounds = bounds
    self.wrappedValue = wrappedValue
  }

  init(wrappedValue: T, _ bounds: ClosedRange<T>) {
    self.init(wrappedValue: wrappedValue, bounds: bounds)
  }

  init(_ bounds: ClosedRange<T>) {
    self.init(wrappedValue: bounds.lowerBound, bounds: bounds)
  }
}
