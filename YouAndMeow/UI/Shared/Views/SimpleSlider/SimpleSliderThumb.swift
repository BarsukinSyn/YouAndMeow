//
//  SimpleSliderThumb.swift
//  YouAndMeow
//

import SwiftUI

struct SimpleSliderThumb: View {
  var color: Color
  var modifier: SliderComponentModifier

  var body: some View {
    self.template.modifier(self.modifier)
  }

  private var template: some View {
    ZStack {
      Circle().fill(self.color)
      Circle().stroke(Color.black, lineWidth: 1).opacity(0.1)
    }
  }
}
