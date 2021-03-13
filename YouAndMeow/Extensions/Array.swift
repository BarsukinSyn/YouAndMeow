//
//  Array.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

extension Array where Element: BinaryFloatingPoint {
  func rounded(to accuracy: RoundingAccuracy) -> Self {
    return self.map { $0.rounded(to: accuracy) }
  }

  func scaledEach(to range: ClosedRange<Float>) -> Self {
    return self.map { $0.scaled(to: range) }
  }
}
