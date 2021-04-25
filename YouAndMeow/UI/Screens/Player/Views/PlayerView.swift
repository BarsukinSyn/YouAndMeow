//
//  PlayerView.swift
//  YouAndMeow
//
//  Created by Vladimir on 31.03.2021.
//

import SwiftUI

struct PlayerView: View {
  var basic: Bool = false
  var fullView: Bool { !self.basic }

  var body: some View {
    ZStack {
      PlayerBackgroundImage().cover()
      self.playerControlPanel.cover(alignment: .bottom)
    }
  }

  var playerControlPanel: some View {
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