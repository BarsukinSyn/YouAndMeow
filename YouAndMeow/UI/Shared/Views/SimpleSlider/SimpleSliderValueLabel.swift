//
//  SimpleSliderValueLabel.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.01.2021.
//

import SwiftUI

struct SimpleSliderValueLabel: View {
  var minimumValueLabel: String
  var maximumValueLabel: String

  private let textModifier: SimpleSliderValueLabelTextModifier = SimpleSliderValueLabelTextModifier()

  var body: some View {
    HStack {
      Text(self.minimumValueLabel).modifier(textModifier)
      Spacer()
      Text(self.maximumValueLabel).modifier(textModifier)
    }
  }
}
