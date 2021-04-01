//
//  PlayerControlPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct PlayerControlPanel: View {
  var verticalSpacing: CGFloat = 24

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      PlaybackSettingPanel()
      ButtonPanel()
    }
  }
}
