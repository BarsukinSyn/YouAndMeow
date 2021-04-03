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
    let playbackSystemEnvironment = PlaybackSystemEnvironment()
    let playbackSystem = playbackSystemEnvironment.playbackSystem
    let playbackSettingsEnvironment = PlaybackSettingsEnvironment(playbackSystem: playbackSystem)

    self.playbackSystemEnvironment = playbackSystemEnvironment
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
