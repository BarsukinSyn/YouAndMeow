//
//  BackgroundImage.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.04.2021.
//

import SwiftUI

struct BackgroundImage: View {
  var body: some View {
    ZStack {
      Color(hex: 0x233449)

      Image("CatsPattern")
        .resizable(resizingMode: .tile)
        .opacity(0.05)
    }
  }
}
