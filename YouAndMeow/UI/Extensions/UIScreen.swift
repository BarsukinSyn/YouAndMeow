//
//  UIScreen.swift
//  YouAndMeow
//

import SwiftUI

extension UIScreen {
  var isSmallScreen: Bool {
    return self.bounds.size.height < 736
  }
}
