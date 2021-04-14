//
//  RoundedCorner.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.04.2021.
//

import SwiftUI

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )

    return Path(path.cgPath)
  }
}
