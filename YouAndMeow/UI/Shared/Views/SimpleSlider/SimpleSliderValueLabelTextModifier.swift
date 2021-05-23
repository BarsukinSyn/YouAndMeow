//
//  SimpleSliderValueLabelTextModifier.swift
//  YouAndMeow
//

import SwiftUI

struct SimpleSliderValueLabelTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content.font(.custom("Kurale-Regular", size: 18))
  }
}
