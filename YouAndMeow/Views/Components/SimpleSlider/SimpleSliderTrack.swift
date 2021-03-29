//
//  SimpleSliderTrack.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSliderTrack: View {
  let minimumTrackColor: Color
  let maximumTrackColor: Color
  let minimumTrackModifier: SliderComponentModifier
  let maximumTrackModifier: SliderComponentModifier

  private let shapeModifier = SimpleSliderTrackShapeModifiers(frameHeight: 6, cornerRadius: 3)

  var body: some View {
    Group {
      self.minimumTrackColor
        .modifier(self.minimumTrackModifier)
        .modifier(self.shapeModifier)

      self.maximumTrackColor
        .modifier(self.maximumTrackModifier)
        .modifier(self.shapeModifier)
    }
  }
}
