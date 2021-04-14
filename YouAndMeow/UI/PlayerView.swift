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
      BackgroundImage().fullScreen()

      VStack {
        PlayerControlPanel()
      }
    }
  }
}
