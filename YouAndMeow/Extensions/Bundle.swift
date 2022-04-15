//
//  Bundle.swift
//  YouAndMeow
//

import Foundation

extension Bundle {
  var displayName: String {
    let displayName = self.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String

    return displayName ?? self.defaultDisplayName
  }

  var defaultDisplayName: String {
    return "You & Meow"
  }
}
