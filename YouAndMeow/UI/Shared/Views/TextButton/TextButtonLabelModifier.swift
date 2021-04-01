//
//  TextButtonLabelModifier.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct TextButtonLabelModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
  }
}

struct TextButtonLabelModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text("Press").modifier(TextButtonLabelModifier())
  }
}
