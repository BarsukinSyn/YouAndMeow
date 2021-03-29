//
//  SimpleSlider.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSlider: View {
  @Binding var value: Float

  var bounds: ClosedRange<Float>

  var minimumValueLabel: String?
  var maximumValueLabel: String?
  var minimumTrackColor: Color = .blue
  var maximumTrackColor: Color = Color.gray.opacity(0.15)
  var thumbColor: Color = .white

  private let sliderHeight: CGFloat = 22
  private let verticalSpacing: CGFloat = 4

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      if let minimumValueLabel = self.minimumValueLabel, let maximumValueLabel = self.maximumValueLabel {
        SimpleSliderValueLabel(minimumValueLabel: minimumValueLabel, maximumValueLabel: maximumValueLabel)
      }

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
      }.frame(height: self.sliderHeight)
    }
  }
}

struct SimpleSlider_Previews: PreviewProvider {
  static var previews: some View {
    SimpleSlider(value: .constant(1), bounds: 0...2)
  }
}
