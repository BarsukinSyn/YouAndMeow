//
//  BreathingPhases.swift
//  YouAndMeow
//

import Foundation

struct BreathingPhases<T> {
  let inhalation: T
  let exhalation: T

  var list: [T] {
    Mirror(reflecting: self).children.map { $0.value } as! [T]
  }
}
