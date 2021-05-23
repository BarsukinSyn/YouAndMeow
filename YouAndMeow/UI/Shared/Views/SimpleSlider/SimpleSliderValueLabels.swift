//
//  SimpleSliderValueLabels.swift
//  YouAndMeow
//

import SwiftUI

struct SimpleSliderValueLabels: View {
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
