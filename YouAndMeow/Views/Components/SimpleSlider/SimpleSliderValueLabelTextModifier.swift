//
//  SimpleSliderValueLabelTextModifier.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.01.2021.
//

import SwiftUI

struct SimpleSliderValueLabelTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
  }
}

struct SimpleSliderValueLabelTextModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text("Minimum value").modifier(SimpleSliderValueLabelTextModifier())
  }
}
