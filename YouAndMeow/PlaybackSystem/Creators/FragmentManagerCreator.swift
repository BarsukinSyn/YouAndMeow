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
    return BreathingFragmentManager()
  }

  static func createMeowingFragmentManager() throws -> MeowingFragmentManager {
    let meowingIntervals = try IntervalsProvider.getMeowingIntervals()
    let meowingFragmentManager = MeowingFragmentManager(withIntervals: meowingIntervals)

    return meowingFragmentManager
  }
}
