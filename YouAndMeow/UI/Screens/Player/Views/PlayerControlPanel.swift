//
//  PlayerControlPanel.swift
//  YouAndMeow
//

import SwiftUI

struct PlayerControlPanel: View {
  var body: some View {
    self.template
      .background(Color(hex: 0x000000, opacity: 0.3))
      .cornerRadius(44, corners: [.topLeft, .topRight])
  }

  private var template: some View {
    VStack {
      PlaybackSettingPanel()
        .padding(EdgeInsets(top: 28, leading: 28, bottom: 40, trailing: 28))

      PlaybackControlPanel()
    }
  }
}
