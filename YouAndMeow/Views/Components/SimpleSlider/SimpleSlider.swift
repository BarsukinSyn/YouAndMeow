//
//  SimpleSlider.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSlider: View {
  @Binding var value: Float

  let bounds: ClosedRange<Float>
  let thumbColor: Color
  let minimumTrackColor: Color
  let maximumTrackColor: Color

  private let containerHeight: CGFloat = 25

  init(
    value: Binding<Float>,
    in bounds: ClosedRange<Float>,
    thumbColor: Color = .white,
    minimumTrackColor: Color = .blue,
    maximumTrackColor: Color = Color.gray.opacity(0.15)
  ) {
    self._value = value
    self.bounds = bounds
    self.thumbColor = thumbColor
    self.minimumTrackColor = minimumTrackColor
    self.maximumTrackColor = maximumTrackColor
  }

  var body: some View {
    SliderBuilder(value: self.$value, in: self.bounds) { (modifiers) in
      ZStack {
        SimpleSliderTrack(
          minimumTrackColor: self.minimumTrackColor,
          maximumTrackColor: self.maximumTrackColor,
          minimumTrackModifier: modifiers.minimumTrack,
          maximumTrackModifier: modifiers.maximumTrack
        )

        SimpleSliderThumb(color: self.thumbColor, modifier: modifiers.thumb)
      }
    }.frame(height: self.containerHeight)
  }
}

struct SimpleSlider_Previews: PreviewProvider {
  static var previews: some View {
    SimpleSlider(value: .constant(1), in: 0...2)
  }
}
