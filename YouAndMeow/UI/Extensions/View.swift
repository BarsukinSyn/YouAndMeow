//
//  View.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.04.2021.
//

import SwiftUI

extension View {
  func cover(alignment: Alignment = .top) -> some View {
    return self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
  }

  func fullscreen() -> some View {
    return self.cover().edgesIgnoringSafeArea(.all)
  }

  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    return self.clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}
