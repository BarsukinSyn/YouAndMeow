//
//  BinaryFloatingPoint.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

enum RoundingAccuracyOptions: Int {
  case tenth = 10
  case hundredth = 100
  case thousandth = 1000
}

extension BinaryFloatingPoint {
  typealias RoundingAccuracy = RoundingAccuracyOptions

  func rounded(to accuracy: BinaryFloatingPoint.RoundingAccuracy) -> Self {
    let accuracy = Self(accuracy.rawValue)
    let roundedValue = Darwin.round(self * accuracy) / accuracy

    return roundedValue
  }

  func scaled(to range: ClosedRange<Float>) -> Self {
    let scale = Float.random(in: range)
    let scaledValue = self * Self(scale)

    return scaledValue
  }
}
