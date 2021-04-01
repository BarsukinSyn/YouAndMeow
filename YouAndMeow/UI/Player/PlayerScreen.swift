//
//  PlayerScreen.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import SwiftUI

struct PlayerScreen: View {
  let playbackSystemEnvironment: PlaybackSystemEnvironment
  let playbackSettingsEnvironment: PlaybackSettingsEnvironment

  init() {
    let audioPlayerEnvironment = PlaybackSystemEnvironment()
    let playbackController = audioPlayerEnvironment.playbackController
    let playbackSettingsEnvironment = PlaybackSettingsEnvironment(playbackController: playbackController)

    self.playbackSystemEnvironment = audioPlayerEnvironment
    self.playbackSettingsEnvironment = playbackSettingsEnvironment
  }

  var body: some View {
    VStack {
      PlayerControlPanel()
        .environmentObject(self.playbackSystemEnvironment)
        .environmentObject(self.playbackSettingsEnvironment)
    }
  }
}
