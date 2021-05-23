//
//  ClosedRange.swift
//  YouAndMeow
//

import Foundation

extension ClosedRange where Bound: BinaryFloatingPoint {
  var mean: Bound {
    return (self.lowerBound + self.upperBound) / 2
  }
}
