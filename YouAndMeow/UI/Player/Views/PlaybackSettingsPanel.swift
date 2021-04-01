//
//  PlaybackSettingsPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.01.2021.
//

import SwiftUI

struct PlaybackSettingsPanel: View {
  @ObservedObject var viewModel: PlaybackSettingsPanelViewModel = PlaybackSettingsPanelViewModel()

  private let verticalSpacing: CGFloat = 24

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      ForEach(self.viewModel.settings, id: \.type) { settings in
        PlaybackSetting(viewModel: settings)
      }
    }
  }
}

struct PlaybackSettingsPanel_Previews: PreviewProvider {
  static var previews: some View {
    PlaybackSettingsPanel()
  }
}
