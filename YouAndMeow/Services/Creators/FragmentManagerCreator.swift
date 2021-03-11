//
//  FragmentManagerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class FragmentManagerCreator {
  private init() {}

  static func createBreathingFragmentManager() -> BreathingFragmentManager {
    let breathingFragmentManager = BreathingFragmentManager(withIntervals: [])

    return breathingFragmentManager
  }

  static func createMeowingFragmentManager() throws -> MeowingFragmentManager {
    let meowingIntervalsSource = IntervalsSourceProvider.getMeowingIntervals()
    let sourceBuffer = try meowingIntervalsSource.readIntoByteBuffer()
    let intervals = try DataDecoder.decodePropertyList(sourceBuffer) as [TimeInterval]
    let meowingFragmentManager = MeowingFragmentManager(withIntervals: intervals)

    return meowingFragmentManager
  }
}
