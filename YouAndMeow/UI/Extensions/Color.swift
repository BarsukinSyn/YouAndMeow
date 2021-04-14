//
//  Color.swift
//  YouAndMeow
//
//  Created by Vladimir on 31.03.2021.
//

import SwiftUI

extension Color {
  init(hex: Int, opacity: Double = 1) {
    let red = Double((hex & 0xFF0000) >> 16) / 255
    let green = Double((hex & 0xFF00) >> 8) / 255
    let blue = Double((hex & 0xFF) >> 0) / 255

    self.init(red: red, green: green, blue: blue, opacity: opacity)
  }
}
