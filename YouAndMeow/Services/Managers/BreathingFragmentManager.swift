//
//  BreathingFragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class BreathingFragmentManager: FragmentManager {
  private var intervals: [TimeInterval]
  @LimitedValue(0 ... 0) private var rate: Float = 0
  @LimitedValue(0 ... 0) private var variability: Float = 0

  private var defaultInterval: TimeInterval {
    self.rate > 0 ? TimeInterval(60 / self.rate / 2) : 0
  }

  private var defaultIntervalScale: Double {
    let limit = self._rate.limit
    let ratio = (self.rate - limit.lowerBound) / (limit.upperBound - limit.lowerBound)
    let scale = ratio.isWithin(0 ... 0.4) ? -0.25 : ratio.isWithin(0.8 ... 1) ? 0.75 : Double.random(in: 0 ... 0.35)

    return scale
  }

  init(withIntervals intervals: [TimeInterval]) {
    self.intervals = intervals
  }

  func setRate(_ rate: LimitedValue<Float>) {
    self._rate = rate
    self.clearIntervals()
  }

  func setVariability(_ variability: LimitedValue<Float>) {
    self._variability = variability
    self.clearIntervals()
  }

  func getFragment() -> SoundFragment {
    let duration = self.getInterval().rounded(to: .hundredth)
    let fragment = SoundFragment(start: 0, end: duration)

    return fragment
  }

  private func getInterval() -> TimeInterval {
    if self.shouldUpdateIntervals(threshold: Float.random(in: 0 ... 1)) {
      self.updateIntervals()
    }

    return self.intervals.popLast() ?? self.defaultInterval
  }

  private func shouldUpdateIntervals(threshold: Float) -> Bool {
    return self.intervals.isEmpty && self.variability > 0 && self.variability > threshold
  }

  private func updateIntervals() {
    let count = Int.random(in: 3 ... 8)
    let scaleShift = Double.random(in: 0.85 ... 1)
    let scale = self.defaultIntervalScale + scaleShift
    let intervals = Array(repeating: self.defaultInterval * scale, count: count)

    self.intervals = intervals.scaledEach(to: 0.85 ... 1)
  }

  private func clearIntervals() {
    self.intervals.removeAll()
  }
}
