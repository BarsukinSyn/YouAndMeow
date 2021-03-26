//
//  BreathingPhases.swift
//  YouAndMeow
//
//  Created by Vladimir on 18.07.2020.
//

import Foundation

struct BreathingPhases<T> {
  let inhalation: T
  let exhalation: T

  var list: [T] {
    Mirror(reflecting: self).children.map { $0.value } as! [T]
  }
}
