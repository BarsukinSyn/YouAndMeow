//
//  SliderModifier.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.01.2021.
//

import SwiftUI

struct SliderModifier: ViewModifier {
  let size: CGSize
  let offset: CGFloat

  func body(content: Content) -> some View {
    content
      .frame(width: self.size.width)
      .position(x: self.size.width / 2, y: self.size.height / 2)
      .offset(x: self.offset)
  }
}
