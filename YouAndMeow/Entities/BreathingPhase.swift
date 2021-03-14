//
//  BreathingPhase.swift
//  YouAndMeow
//
//  Created by Vladimir on 18.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

struct BreathingPhase<T> {
  let inhalation: T
  let exhalation: T

  var list: [T] {
    Mirror(reflecting: self).children.map { $0.value } as! [T]
  }
}
