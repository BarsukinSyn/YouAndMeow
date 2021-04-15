//
//  IconButton.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct IconButton: View {
  var icon: String
  var action: VoidFunction
  var color: Color = .white
  var size: CGFloat = 18

  var body: some View {
    Button(action: self.action) {
      Image(systemName: self.icon)
        .foregroundColor(self.color)
        .font(.system(size: self.size))
    }
  }
}
