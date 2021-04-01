//
//  PlaybackControlPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct PlaybackControlPanel: View {
  @ObservedObject var viewModel: PlaybackControlPanelViewModel = PlaybackControlPanelViewModel()

  private let verticalSpacing: CGFloat = 24

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      PlaybackSettingsPanel()

      PlaybackButtonPanel(
        isActive: self.$viewModel.isPlaying,
        playButtonAction: self.viewModel.play,
        stopButtonAction: self.viewModel.stop,
        resetButtonAction: {}
      )
    }
  }
}

struct PlaybackControlPanel_Previews: PreviewProvider {
  static var previews: some View {
    PlaybackControlPanel()
  }
}
