//
//  View.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.04.2021.
//

import SwiftUI

extension View {
  func fullScreen() -> some View {
    return self.frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all)
  }

  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    return self.clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}
