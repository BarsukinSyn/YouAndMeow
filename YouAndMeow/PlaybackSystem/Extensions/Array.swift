//
//  Array.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//

import Foundation

extension Array where Element: BinaryFloatingPoint {
  func roundedEach(to accuracy: RoundingAccuracy) -> Self {
    return self.map { $0.rounded(to: accuracy) }
  }

  func scaledEach(by factor: Float) -> Self {
    return self.map { $0.scaled(by: factor) }
  }

  func scaledEach(in range: ClosedRange<Float>) -> Self {
    return self.map { $0.scaled(in: range) }
  }
}
