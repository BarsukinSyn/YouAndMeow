//
//  PlaybackControlPanel.swift
//  YouAndMeow
//

import SwiftUI

struct PlaybackControlPanel: View {
  @EnvironmentObject var shutdownTimer: ShutdownTimerEnvironment
  @EnvironmentObject var playbackSystem: PlaybackSystemEnvironment
  @EnvironmentObject var playbackSettings: PlaybackSettingsEnvironment

  var body: some View {
    self.template
      .frame(maxWidth: .infinity, minHeight: 84)
      .background(Color(hex: 0x2E445F))
      .cornerRadius(44, corners: [.topLeft, .topRight])
  }

  private var template: some View {
    HStack(spacing: 24) {
      IconButton(icon: "timer", action: self.shutdownTimer.prepare)
        .disabled(!self.playbackSystem.isPlaying)

      self.renderPlaybackControlButton(isPlaying: self.playbackSystem.isPlaying)

      IconButton(icon: "arrow.left.arrow.right", action: self.playbackSettings.reset)
        .disabled(!self.playbackSystem.isPlaying)
    }
  }

  private func renderPlaybackControlButton(isPlaying: Bool) -> some View {
    let icon = isPlaying ? "pause.circle.fill" : "play.circle.fill"
    let action = isPlaying ? self.stopPlaying : self.startPlaying

    return IconButton(icon: icon, action: action, size: 34)
  }

  private func startPlaying() {
    self.playbackSystem.play()
    self.shutdownTimer.cancel()
  }

  private func stopPlaying() {
    self.playbackSystem.stop()
    self.shutdownTimer.cancel()
  }
}
