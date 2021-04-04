//
//  BoundedValue.swift
//  YouAndMeow
//
//  Created by Vladimir on 06.07.2020.
//

import Foundation

struct BoundedValue<T: BinaryFloatingPoint> {
  let bounds: ClosedRange<T>

  private var currentValue: T!

  var value: T {
    get { self.currentValue }
    set { self.currentValue = newValue.clamped(self.bounds) }
  }

  var valueRatio: T {
    (self.value - self.bounds.lowerBound) / (self.bounds.upperBound - self.bounds.lowerBound)
  }

  init(_ initialValue: T, bounds: ClosedRange<T>) {
    self.bounds = bounds
    self.value = initialValue
  }
}
