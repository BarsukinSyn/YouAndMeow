//
//  IconButton.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct IconButton: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  var icon: String
  var action: VoidFunction
  var color: Color = .white
  var size: CGFloat = 18

  var body: some View {
    Button(action: self.action) {
      Image(systemName: self.icon)
        .foregroundColor(self.color)
        .font(.system(size: self.size))
        .opacity(self.isEnabled ? 1 : 0.3)
    }
  }
}
