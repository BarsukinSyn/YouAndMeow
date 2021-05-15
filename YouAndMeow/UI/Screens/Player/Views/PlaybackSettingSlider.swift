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

  private var bindedValue: Binding<Float> {
    Binding(
      get: { self.setting.value },
      set: { self.action(self.type, $0) }
    )
  }

  var body: some View {
    SimpleSlider(
      value: self.bindedValue,
      bounds: self.setting.bounds,
      minimumValueLabel: self.meta.minimumValueLabel,
      maximumValueLabel: self.meta.maximumValueLabel,
      textColor: .white
    )
  }
}
