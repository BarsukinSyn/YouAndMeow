//
//  Comparable.swift
//  YouAndMeow
//
//  Created by Vladimir on 06.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

extension Comparable {
  func clamped(_ range: ClosedRange<Self>) -> Self {
    return self < range.lowerBound ? range.lowerBound : self > range.upperBound ? range.upperBound : self
  }

  func isWithin(_ range: ClosedRange<Self>) -> Bool {
    return self >= range.lowerBound && self <= range.upperBound
  }
}
