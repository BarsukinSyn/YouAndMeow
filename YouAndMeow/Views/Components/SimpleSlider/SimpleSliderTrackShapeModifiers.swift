//
//  SimpleSliderTrackShapeModifiers.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSliderTrackShapeModifiers: ViewModifier {
  let frameHeight: CGFloat
  let cornerRadius: CGFloat

  func body(content: Content) -> some View {
    content.frame(height: self.frameHeight).cornerRadius(self.cornerRadius)
  }
}
