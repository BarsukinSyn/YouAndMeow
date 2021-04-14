//
//  ButtonPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct ButtonPanel: View {
  var body: some View {
    self.template
      .frame(maxWidth: .infinity, maxHeight: 80)
      .background(Color(hex: 0x2E445F))
      .cornerRadius(50, corners: [.topLeft, .topRight])
  }

  var template: some View {
    HStack {
      PlaybackControlButtons()
    }
  }
}
