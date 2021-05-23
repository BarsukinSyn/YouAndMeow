//
//  PlayerBackgroundImage.swift
//  YouAndMeow
//

import SwiftUI

struct PlayerBackgroundImage: View {
  var body: some View {
    ZStack {
      Color(hex: 0x233449)

      Image("CatsPattern")
        .resizable(resizingMode: .tile)
        .opacity(0.05)
    }
  }
}
