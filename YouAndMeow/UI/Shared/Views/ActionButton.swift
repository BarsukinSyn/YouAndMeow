//
//  ActionButton.swift
//  YouAndMeow
//

import SwiftUI

struct ActionButton: View {
  var label: String
  var action: VoidFunction

  var body: some View {
    Button(action: self.action, label: {
      Text(self.label)
        .foregroundColor(.blue)
        .font(.system(size: 18))
        .frame(maxWidth: .infinity)
        .padding(16)
    })
  }
}
