//
//  PlayerScreen.swift
//  YouAndMeow
//

import SwiftUI

struct PlayerScreen: View {
  private let shutdownTimerEnvironment: ShutdownTimerEnvironment
  private let playbackSystemEnvironment: PlaybackSystemEnvironment
  private let playbackSettingsEnvironment: PlaybackSettingsEnvironment

  private let isSmallScreen: Bool = UIScreen.main.bounds.size.height < 736

  init() {
    let playbackSystemEnvironment = PlaybackSystemEnvironment()
    let playbackSystem = playbackSystemEnvironment.playbackSystem
    let playbackSettingsEnvironment = PlaybackSettingsEnvironment(playbackSystem: playbackSystem)
    let shutdownTimerEnvironment = ShutdownTimerEnvironment(playbackSystemEnvironment: playbackSystemEnvironment)

    self.shutdownTimerEnvironment = shutdownTimerEnvironment
    self.playbackSystemEnvironment = playbackSystemEnvironment
    self.playbackSettingsEnvironment = playbackSettingsEnvironment
  }

  var body: some View {
    PlayerView(basic: self.isSmallScreen)
      .fullscreen()
      .environmentObject(self.shutdownTimerEnvironment)
      .environmentObject(self.playbackSystemEnvironment)
      .environmentObject(self.playbackSettingsEnvironment)
  }
}
