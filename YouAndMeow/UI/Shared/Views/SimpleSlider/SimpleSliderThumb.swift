//
//  SimpleSliderThumb.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSliderThumb: View {
  var color: Color
  var modifier: SliderComponentModifier

  var body: some View {
    ZStack {
      Circle().fill(self.color)
      Circle().stroke(Color.black, lineWidth: 1).opacity(0.1)
    }.modifier(self.modifier)
  }
}
