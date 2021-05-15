//
//  PlaybackSettingPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.01.2021.
//

import SwiftUI

struct PlaybackSettingPanel: View {
  @EnvironmentObject var playbackSystem: PlaybackSystemEnvironment
  @EnvironmentObject var playbackSettings: PlaybackSettingsEnvironment

  var viewData: PlaybackSettingPanelViewModel = PlaybackSettingPanelViewModel()

  var body: some View {
    self.template.disabled(!playbackSystem.isPlaying)
  }

  private var template: some View {
    VStack(spacing: 20) {
      ForEach(self.viewData.settingTypeOrder, id: \.self) { (settingType) in
        PlaybackSettingSlider(
          type: settingType,
          setting: self.playbackSettings.get(settingType),
          meta: self.viewData.getMetadata(of: settingType),
          action: self.handleSliderChange
        )
      }
    }
  }

  private func handleSliderChange(settingType: PlaybackSettingType, value: Float) {
    self.playbackSettings.set(value, settingType: settingType)
  }
}
