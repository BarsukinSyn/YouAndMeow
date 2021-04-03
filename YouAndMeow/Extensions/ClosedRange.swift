//
//  ClosedRange.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.02.2021.
//

import Foundation

extension ClosedRange where Bound: BinaryFloatingPoint {
  var mean: Bound {
    return (self.lowerBound + self.upperBound) / 2
  }
}
