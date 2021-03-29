//
//  SliderComponentModifier.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.01.2021.
//

import SwiftUI

struct SliderComponentModifier: ViewModifier {
  let size: CGSize
  let offset: CGFloat

  func body(content: Content) -> some View {
    content
      .frame(width: self.size.width, height: self.size.height)
      .position(x: self.size.width / 2, y: self.size.height / 2)
      .offset(x: self.offset)
  }
}
