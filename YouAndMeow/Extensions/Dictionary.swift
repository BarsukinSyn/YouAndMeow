//
//  Dictionary.swift
//  YouAndMeow
//

import Foundation

prefix operator <!>

extension Dictionary where Key: CaseIterable {
  static prefix func <!> (_ dictionary: Self) -> Self {
    return self.init(strictly: true, dictionary: dictionary)
  }

  init(strictly: Bool, dictionary: Dictionary<Key, Value>) {
    if (strictly) {
      Key.allCases.forEach {
        if dictionary[$0] == nil { fatalError() }
      }
    }

    self = dictionary
  }
}
