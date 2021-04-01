//
//  PlaybackControlButtons.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import SwiftUI

struct PlaybackControlButtons: View {
  @EnvironmentObject var playbackSystem: PlaybackSystemEnvironment
  @EnvironmentObject var playbackSettings: PlaybackSettingsEnvironment

  var body: some View {
    HStack {
      TextButton(label: "Reset", action: self.playbackSettings.reset).disabled(!self.playbackSystem.isPlaying)

      self.playbackSystem.isPlaying
        ? TextButton(label: "Stop", action: self.playbackSystem.stop)
        : TextButton(label: "Play", action: self.playbackSystem.play)
    }
  }
}
