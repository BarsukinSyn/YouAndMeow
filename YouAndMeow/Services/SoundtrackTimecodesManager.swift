//
//  SoundtrackTimecodesManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class SoundtrackTimecodesManager {
  let timecodes: SoundtrackTimecodes

  init(_ timecodes: SoundtrackTimecodes) {
    self.timecodes = timecodes
  }

  func getRandomSoundFragment() -> SoundFragment {
    let randomIndex = Int.random(in: 0 ..< self.timecodes.count - 1)
    let soundFragment = SoundFragment(start: self.timecodes[randomIndex], end: self.timecodes[randomIndex + 1])

    return soundFragment
  }
}
