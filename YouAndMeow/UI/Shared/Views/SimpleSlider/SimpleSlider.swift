//
//  SimpleSlider.swift
//  YouAndMeow
//

import SwiftUI

struct SimpleSlider: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  @Binding private (set) var value: Float

  var bounds: ClosedRange<Float>

  var minimumValueLabel: String?
  var maximumValueLabel: String?
  var minimumTrackColor: Color = Color(hex: 0xE8954B)
  var maximumTrackColor: Color = Color(hex: 0xF9E3D8, opacity: 0.3)
  var thumbColor: Color = .white
  var textColor: Color = .black

  var body: some View {
    VStack(spacing: 10) {
      self.labels
      self.slider.frame(height: 20)
    }
  }

  private var labels: some View {
    Group {
      if let minimumValueLabel = self.minimumValueLabel, let maximumValueLabel = self.maximumValueLabel {
        SimpleSliderValueLabels(minimumValueLabel: minimumValueLabel, maximumValueLabel: maximumValueLabel)
          .foregroundColor(self.textColor)
      }
    }
  }

  private var slider: some View {
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
    }
  }
}
