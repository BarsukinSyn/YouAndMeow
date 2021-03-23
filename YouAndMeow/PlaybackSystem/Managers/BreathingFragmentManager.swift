//
//  BreathingFragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class BreathingFragmentManager {
  private var intervals: [TimeInterval] = []
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

  func setRate(_ rate: LimitedValue<Float>) {
    self._rate = rate
    self.clearIntervals()
  }

  func setVariability(_ variability: LimitedValue<Float>) {
    self._variability = variability
    self.clearIntervals()
  }

  func getRandomFragment() -> SoundFragment {
    return self.getNextFragment(scaledBy: .random(in: 0.9 ... 1.1))
  }

  private func getNextFragment(scaledBy factor: Float) -> SoundFragment {
    let interval = self.getInterval().scaled(by: factor)
    let fragment = SoundFragment(start: 0, end: interval)

    return fragment
  }

  private func getInterval() -> TimeInterval {
    if self.shouldUpdateIntervals(threshold: .random(in: 0 ... 1)) {
      self.updateIntervals(scaleEachIn: 0.85 ... 1)
    }

    return self.intervals.popLast() ?? self.defaultInterval
  }

  private func shouldUpdateIntervals(threshold: Float) -> Bool {
    let intervalsIsEmpty = self.intervals.isEmpty
    let variabilityIsPositive = self.variability > 0
    let thresholdIsExceeded = self.variability > threshold

    return intervalsIsEmpty && variabilityIsPositive && thresholdIsExceeded
  }

  private func updateIntervals(scaleEachIn range: ClosedRange<Float>) {
    let intervals = self.generateIntervals(count: .random(in: 3 ... 8), scaleShift: .random(in: 0.85 ... 1))
    let scaledIntervals = intervals.scaledEach(in: range)

    self.intervals = scaledIntervals
  }

  private func generateIntervals(count: Int, scaleShift: Double) -> [TimeInterval] {
    let scale = self.defaultIntervalScale + scaleShift
    let scaledInterval = self.defaultInterval * scale
    let intervals = Array(repeating: scaledInterval, count: count)

    return intervals
  }

  private func clearIntervals() {
    self.intervals.removeAll()
  }
}
