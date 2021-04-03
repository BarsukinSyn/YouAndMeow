//
//  PlaybackSettingSlider.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct PlaybackSettingSlider: View {
  var type: PlaybackSettingType
  var data: PlaybackSettingData
  var meta: PlaybackSettingMetadata
  var action: (PlaybackSettingType, Float) -> Void

  var body: some View {
    SimpleSlider(
      value: self.bindedValue,
      bounds: self.data.bounds,
      minimumValueLabel: self.meta.minimumValueLabel,
      maximumValueLabel: self.meta.maximumValueLabel
    )
  }

  var bindedValue: Binding<Float> {
    Binding(
      get: { self.data.value },
      set: { (newValue) in
        self.action(self.type, newValue)
      }
    )
  }
}
