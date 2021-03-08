//
//  TimecodesManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class TimecodesManager {
  let timecodes: Timecodes

  init(withSource source: Source) throws {
    let sourceBuffer = try source.readIntoByteBuffer()
    let timecodes = try DataDecoder.decodePropertyList(sourceBuffer) as Timecodes

    self.timecodes = timecodes
  }

  func getRandomSoundFragment() -> SoundFragment {
    let randomIndex = Int.random(in: 0 ..< self.timecodes.count - 1)
    let soundFragment = SoundFragment(start: self.timecodes[randomIndex], end: self.timecodes[randomIndex + 1])

    return soundFragment
  }
}
