//
//  MeowingFragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class MeowingFragmentManager {
  private let intervals: [TimeInterval]

  init(withIntervals intervals: [TimeInterval]) {
    self.intervals = intervals
  }

  func getRandomFragment() -> SoundFragment {
    let randomIntervalIndex = Int.random(in: 0 ..< self.intervals.count - 1)
    let fragment = self.getFragment(byIndex: randomIntervalIndex)

    return fragment!
  }

  private func getFragment(byIndex index: Int) -> SoundFragment? {
    guard index < self.intervals.count - 1 else { return nil }

    let fragmentStart = self.intervals[index]
    let fragmentEnd = self.intervals[index + 1]
    let fragment = SoundFragment(start: fragmentStart, end: fragmentEnd)

    return fragment
  }
}
