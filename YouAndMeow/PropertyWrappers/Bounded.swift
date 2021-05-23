//
//  Bounded.swift
//  YouAndMeow
//

import Foundation

@propertyWrapper struct Bounded<T: Numeric & Comparable> {
  private (set) var boundedValue: BoundedValue<T>

  var wrappedValue: T {
    get { self.boundedValue.value }
    set { self.boundedValue.value = newValue }
  }

  init(wrappedValue: T, bounds: ClosedRange<T>) {
    self.boundedValue = BoundedValue(wrappedValue, bounds: bounds)
  }

  init(wrappedValue: T, _ bounds: ClosedRange<T>) {
    self.init(wrappedValue: wrappedValue, bounds: bounds)
  }

  init(_ bounds: ClosedRange<T>) {
    self.init(wrappedValue: bounds.lowerBound, bounds: bounds)
  }
}
