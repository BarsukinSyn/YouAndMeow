//
//  Tooltip.swift
//  YouAndMeow
//
//  Created by Vladimir on 04.02.2021.
//

import SwiftUI

struct Tooltip: View {
  var label: String
  @Binding var isVisible: Bool

  @State private var opacityLevel: BoundedValue = BoundedValue(0, bounds: 0 ... 1)

  private let labelModifier = TooltipLabelModifier()

  var body: some View {
    Text(self.label)
      .modifier(self.labelModifier)
      .opacity(self.opacityLevel.value)
      .onChange(of: self.isVisible) { isVisible in
        withAnimation(.easeInOut(duration: 0.5)) {
          self.opacityLevel.value = isVisible ? 1 : 0
        }
      }
  }
}
