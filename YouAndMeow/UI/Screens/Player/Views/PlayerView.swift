//
//  PlayerView.swift
//  YouAndMeow
//
//  Created by Vladimir on 31.03.2021.
//

import SwiftUI

struct PlayerView: View {
  var body: some View {
    ZStack {
      PlayerBackgroundImage().cover()
      self.playerControlPanel.cover(alignment: .bottom)
    }
  }

  var playerControlPanel: some View {
    VStack(spacing: 0) {
      Logo().padding(.horizontal, 30).opacity(0.8)
      PlayerControlPanel()
    }
  }
}
