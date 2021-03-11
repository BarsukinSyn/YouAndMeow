//
//  Array.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

extension Array where Element: BinaryFloatingPoint {
  func scaled(to range: ClosedRange<Float>) -> Self {
    return self.map { $0.scaled(to: range) }
  }
}
