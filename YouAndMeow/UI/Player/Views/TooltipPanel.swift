//
//  TooltipPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 04.02.2021.
//

import SwiftUI

struct TooltipPanel: View {
  @EnvironmentObject var playbackSettings: PlaybackSettingsEnvironment

  @State var visible: Bool = false

  var viewData: TooltipPanelViewModel = TooltipPanelViewModel()

  var lastModified: (settingType: PlaybackSettingType, setting: PlaybackSetting)? {
    guard let settingType = self.playbackSettings.lastModified else { return nil }

    return (settingType, self.playbackSettings.get(settingType))
  }

  var formattedText: String {
    guard let (settingType, setting) = self.lastModified else { return " " }

    return self.viewData.formatSetting(setting, of: settingType)
  }

  var body: some View {
    Tooltip(label: self.formattedText, isVisible: self.$visible)
      .onChange(of: self.lastModified?.setting.value) { settingValue in
        withAnimation { self.visible = true }
      }
  }
}