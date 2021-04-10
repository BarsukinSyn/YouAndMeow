//
//  SimpleSlider.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSlider: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  @Binding var value: Float

  var bounds: ClosedRange<Float>

  var minimumValueLabel: String?
  var maximumValueLabel: String?
  var minimumTrackColor: Color = .blue
  var maximumTrackColor: Color = Color.gray.opacity(0.15)
  var thumbColor: Color = .white

  private let sliderHeight: CGFloat = 24
  private let verticalSpacing: CGFloat = 8

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      if let minimumValueLabel = self.minimumValueLabel, let maximumValueLabel = self.maximumValueLabel {
        SimpleSliderValueLabel(minimumValueLabel: minimumValueLabel, maximumValueLabel: maximumValueLabel)
      }

      SliderBuilder(value: self.$value, bounds: self.bounds) { (modifiers) in
        ZStack {
          SimpleSliderTrack(
            minimumTrackColor: self.minimumTrackColor.opacity(self.isEnabled ? 1 : 0.5),
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
