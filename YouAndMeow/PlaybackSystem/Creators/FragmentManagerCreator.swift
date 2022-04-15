//
//  FragmentManagerCreator.swift
//  YouAndMeow
//

import Foundation

final class FragmentManagerCreator: StaticClass {
  static func createBreathingFragmentManager() -> BreathingFragmentManager {
    return BreathingFragmentManager()
  }

  static func createMeowingFragmentManager() throws -> MeowingFragmentManager {
    let meowingIntervals = try IntervalsRepository.getMeowingIntervals()
    let meowingFragmentManager = MeowingFragmentManager(withIntervals: meowingIntervals)

    return meowingFragmentManager
  }
}
