//
//  SoundFragment.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//

import Foundation

struct SoundFragment {
  let start: TimeInterval
  let end: TimeInterval

  var duration: TimeInterval {
    self.end - self.start
  }
}
