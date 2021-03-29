//
//  SimpleSliderTrackShapeModifier.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSliderTrackShapeModifier: ViewModifier {
  let frameHeight: CGFloat
  let cornerRadius: CGFloat

  func body(content: Content) -> some View {
    content.frame(height: self.frameHeight).cornerRadius(self.cornerRadius)
  }
}

struct SimpleSliderTrackShapeModifiers_Previews: PreviewProvider {
  static var previews: some View {
    Color(.orange).modifier(SimpleSliderTrackShapeModifier(frameHeight: 8, cornerRadius: 6))
  }
}
