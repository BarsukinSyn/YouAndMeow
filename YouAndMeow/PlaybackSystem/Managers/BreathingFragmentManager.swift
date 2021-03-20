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
    let rateRange = self._rate.range
    let ratio = (self.rate - rateRange.lowerBound) / (rateRange.upperBound - rateRange.lowerBound)
    let scale = ratio.isWithin(0 ... 0.4) ? -0.25 : ratio.isWithin(0.8 ... 1) ? 0.75 : .random(in: 0 ... 0.35)

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
    let duration = self.getInterval().scaled(to: 0.9 ... 1.1)
    let fragment = SoundFragment(start: 0, end: duration)

    return fragment
  }

  private func getInterval() -> TimeInterval {
    if self.shouldUpdateIntervals(threshold: .random(in: 0 ... 1)) {
      self.updateIntervals()
    }

    return self.intervals.popLast() ?? self.defaultInterval
  }

  private func shouldUpdateIntervals(threshold: Float) -> Bool {
    return self.intervals.isEmpty && self.variability > 0 && self.variability > threshold
  }

  private func updateIntervals() {
    let intervals = self.generateIntervals(count: .random(in: 3 ... 8), scaleShift: .random(in: 0.85 ... 1))

    self.intervals = intervals.scaledEach(to: 0.85 ... 1)
  }

  private func generateIntervals(count: Int, scaleShift: Double) -> [TimeInterval] {
    let scale = self.defaultIntervalScale + scaleShift
    let intervals = Array(repeating: self.defaultInterval * scale, count: count)

    return intervals
  }

  private func clearIntervals() {
    self.intervals.removeAll()
  }
}
