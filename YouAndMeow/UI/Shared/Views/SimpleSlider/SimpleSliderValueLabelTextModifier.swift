//
//  SimpleSliderValueLabelTextModifier.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.01.2021.
//

import SwiftUI

struct SimpleSliderValueLabelTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content.font(.custom("Kurale-Regular", size: 18))
  }
}
