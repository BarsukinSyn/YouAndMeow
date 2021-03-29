//
//  SimpleSliderThumb.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.01.2021.
//

import SwiftUI

struct SimpleSliderThumb: View {
  let color: Color
  let modifier: SliderComponentModifier

  var body: some View {
    ZStack {
      Circle().fill(self.color)
      Circle().stroke(Color.black, lineWidth: 1).opacity(0.05)
    }.modifier(self.modifier)
  }
}
