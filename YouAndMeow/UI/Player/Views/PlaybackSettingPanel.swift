//
//  PlaybackSettingPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.01.2021.
//

import SwiftUI

struct PlaybackSettingPanel: View {
  @EnvironmentObject var playbackSettings: PlaybackSettingsEnvironment

  var viewData: PlaybackSettingPanelViewModel = PlaybackSettingPanelViewModel()
  var verticalSpacing: CGFloat = 24

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      ForEach(self.viewData.settingTypeOrder, id: \.self) { (settingType) in
        PlaybackSettingSlider(
          type: settingType,
          data: self.playbackSettings.getData(of: settingType),
          meta: self.viewData.getMetadata(of: settingType),
          action: self.sliderChangeHandler
        )
      }
    }
  }

  func sliderChangeHandler(settingType: PlaybackSettingType, value: Float) {
    self.playbackSettings.setValue(value, settingType: settingType)
  }
}
