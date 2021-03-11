//
//  BinaryFloatingPoint.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

extension BinaryFloatingPoint {
  func scaled(to range: ClosedRange<Float>) -> Self {
    let scale = Float.random(in: range)

    return self * Self(scale)
  }
}
