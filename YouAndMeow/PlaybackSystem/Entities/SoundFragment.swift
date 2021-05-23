//
//  SoundFragment.swift
//  YouAndMeow
//

import Foundation

struct SoundFragment {
  let start: TimeInterval
  let end: TimeInterval

  var duration: TimeInterval {
    self.end - self.start
  }
}
