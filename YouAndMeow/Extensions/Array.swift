//
//  Array.swift
//  YouAndMeow
//

import Foundation

extension Array where Element: BinaryFloatingPoint {
  func scaledEach(byRandomWithin range: ClosedRange<Float>) -> Self {
    return self.map { $0.scaled(byRandomWithin: range) }
  }
}
