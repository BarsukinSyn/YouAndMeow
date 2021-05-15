//
//  PlaybackControlPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import SwiftUI

struct PlaybackControlPanel: View {
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
      IconButton(icon: "shuffle", action: self.playbackSettings.shuffle)
        .disabled(!self.playbackSystem.isPlaying)

      self.renderPlaybackControlButton(isPlaying: self.playbackSystem.isPlaying)

      IconButton(icon: "arrow.left.arrow.right", action: self.playbackSettings.reset)
        .disabled(!self.playbackSystem.isPlaying)
    }
  }

  private func renderPlaybackControlButton(isPlaying: Bool) -> some View {
    let icon = isPlaying ? "pause.circle.fill" : "play.circle.fill"
    let action = isPlaying ? self.playbackSystem.stop : self.playbackSystem.play

    return IconButton(icon: icon, action: action, size: 34)
  }
}
