//
//  TextButton.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct TextButton: View {
  var label: String
  var action: VoidFunction

  private let labelModifier = TextButtonLabelModifier()

  var body: some View {
    Button(action: self.action, label: {
      Text(self.label).modifier(self.labelModifier)
    })
  }

  func disabled(_ disabled: Bool) -> some View {
    self.body.disabled(disabled)
  }
}
