//
//  PlaybackSettingSlider.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct PlaybackSettingSlider: View {
  var type: PlaybackSettingType
  var setting: PlaybackSetting
  var meta: PlaybackSettingMetadata
  var action: (PlaybackSettingType, Float) -> Void

  var bindedValue: Binding<Float> {
    Binding(
      get: { self.setting.value },
      set: { (newValue) in
        self.action(self.type, newValue)
      }
    )
  }

  var body: some View {
    SimpleSlider(
      value: self.bindedValue,
      bounds: self.setting.bounds,
      minimumValueLabel: self.meta.minimumValueLabel,
      maximumValueLabel: self.meta.maximumValueLabel
    )
  }
}
