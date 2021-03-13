//
//  MeowingFragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class MeowingFragmentManager: FragmentManager {
  private let intervals: [TimeInterval]

  init(withIntervals intervals: [TimeInterval]) {
    self.intervals = intervals
  }

  func getFragment() -> SoundFragment {
    let randomIntervalIndex = Int.random(in: 0 ..< self.intervals.count - 1)
    let fragmentStart = self.intervals[randomIntervalIndex].rounded(to: .hundredth)
    let fragmentEnd = self.intervals[randomIntervalIndex + 1].rounded(to: .hundredth)
    let fragment = SoundFragment(start: fragmentStart, end: fragmentEnd)

    return fragment
  }
}
