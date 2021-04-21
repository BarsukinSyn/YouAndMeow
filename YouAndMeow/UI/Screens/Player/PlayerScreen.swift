//
//  PlayerScreen.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import SwiftUI

struct PlayerScreen: View {
  private let playbackSystemEnvironment: PlaybackSystemEnvironment
  private let playbackSettingsEnvironment: PlaybackSettingsEnvironment

  private let isSmallScreen: Bool = UIScreen.main.bounds.size.height < 736

  init() {
    let playbackSystemEnvironment = PlaybackSystemEnvironment()
    let playbackSystem = playbackSystemEnvironment.playbackSystem
    let playbackSettingsEnvironment = PlaybackSettingsEnvironment(playbackSystem: playbackSystem)

    self.playbackSystemEnvironment = playbackSystemEnvironment
    self.playbackSettingsEnvironment = playbackSettingsEnvironment
  }

  var body: some View {
    PlayerView(basic: self.isSmallScreen)
      .fullscreen()
      .environmentObject(self.playbackSystemEnvironment)
      .environmentObject(self.playbackSettingsEnvironment)
  }
}
