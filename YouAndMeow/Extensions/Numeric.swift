//
//  Numeric.swift
//  YouAndMeow
//

import Foundation

extension Numeric where Self: Comparable {
  func clamped(_ range: ClosedRange<Self>) -> Self {
    return self < range.lowerBound ? range.lowerBound : self > range.upperBound ? range.upperBound : self
  }

  func isWithin(_ range: ClosedRange<Self>) -> Bool {
    return self >= range.lowerBound && self <= range.upperBound
  }
}
