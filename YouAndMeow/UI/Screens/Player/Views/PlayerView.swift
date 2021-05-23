//
//  PlayerView.swift
//  YouAndMeow
//

import SwiftUI

struct PlayerView: View {
  @EnvironmentObject var shutdownTimer: ShutdownTimerEnvironment

  var basic: Bool = false
  var fullView: Bool { !self.basic }

  var body: some View {
    ZStack {
      PlayerBackgroundImage().cover()
      self.playerControlPanel.cover(alignment: .bottom)

      if self.shutdownTimer.status == .preparation {
        ShutdownTimePicker().cover()
      }
    }
  }

  private var playerControlPanel: some View {
    VStack(alignment: .trailing, spacing: 0) {
      if self.fullView {
        Logo()
          .padding(EdgeInsets(top: 40, leading: 30, bottom: 0, trailing: 30))
          .opacity(0.9)
      }

      PlayerControlPanel()
    }
  }
}
