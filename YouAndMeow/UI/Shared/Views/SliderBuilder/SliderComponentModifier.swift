//
//  SliderComponentModifier.swift
//  YouAndMeow
//

import SwiftUI

struct SliderComponentModifier: ViewModifier {
  var size: CGSize
  var offset: CGFloat

  func body(content: Content) -> some View {
    content
      .frame(width: self.size.width, height: self.size.height)
      .position(x: self.size.width / 2, y: self.size.height / 2)
      .offset(x: self.offset)
  }
}
