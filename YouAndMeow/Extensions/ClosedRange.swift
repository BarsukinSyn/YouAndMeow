//
//  ClosedRange.swift
//  YouAndMeow
//
//  Created by Vladimir on 29.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

extension ClosedRange {
  func clamped(_ value: Bound) -> Bound {
    return value < self.lowerBound ? self.lowerBound : value > self.upperBound ? self.upperBound : value
  }
}
