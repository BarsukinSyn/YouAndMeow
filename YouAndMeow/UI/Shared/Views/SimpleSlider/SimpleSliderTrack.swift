//
//  SimpleSliderTrack.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSliderTrack: View {
  var minimumTrackColor: Color
  var maximumTrackColor: Color
  var minimumTrackModifier: SliderComponentModifier
  var maximumTrackModifier: SliderComponentModifier

  private let trackShapeModifier: SimpleSliderTrackShapeModifier = SimpleSliderTrackShapeModifier(
    frameHeight: 6,
    cornerRadius: 3
  )

  var body: some View {
    Group {
      self.minimumTrackColor
        .modifier(self.minimumTrackModifier)
        .modifier(self.trackShapeModifier)

      self.maximumTrackColor
        .modifier(self.maximumTrackModifier)
        .modifier(self.trackShapeModifier)
    }
  }
}
