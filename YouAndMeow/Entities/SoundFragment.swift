//
//  SoundFragment.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

struct SoundFragment {
  let start: TimeInterval
  let end: TimeInterval

  var duration: TimeInterval {
    self.end - self.start
  }
}
