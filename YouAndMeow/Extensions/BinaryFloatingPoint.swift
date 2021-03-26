//
//  BinaryFloatingPoint.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//

import Foundation

extension BinaryFloatingPoint {
  func rounded(to accuracy: RoundingAccuracy) -> Self {
    let accuracy = Self(accuracy.rawValue)
    let roundedValue = Darwin.round(self * accuracy) / accuracy

    return roundedValue
  }

  func scaled(by factor: Float) -> Self {
    return self * Self(factor)
  }

  func scaled(in range: ClosedRange<Float>) -> Self {
    let scale = Float.random(in: range)
    let scaledValue = self * Self(scale)

    return scaledValue
  }
}
