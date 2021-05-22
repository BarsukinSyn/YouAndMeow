//
//  ActionButton.swift
//  YouAndMeow
//
//  Created by Vladimir on 18.05.2021.
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
