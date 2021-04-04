//
//  BreathingFragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//

import Foundation

final class BreathingFragmentManager {
  private var intervals: [TimeInterval] = []
  @BoundedValue(PlaybackSystemSettingsBounds.breathingRate) private var rate: Float
  @BoundedValue(PlaybackSystemSettingsBounds.variability) private var variability: Float

  private var defaultInterval: TimeInterval {
    self.rate > 0 ? TimeInterval(60 / self.rate / 2) : 0
  }

  private var defaultIntervalScale: Double {
    let rateBounds = self._rate.bounds
    let ratio = (self.rate - rateBounds.lowerBound) / (rateBounds.upperBound - rateBounds.lowerBound)
    let scale = ratio.isWithin(0 ... 0.4) ? -0.25 : ratio.isWithin(0.8 ... 1) ? 0.75 : .random(in: 0 ... 0.35)

    return scale
  }

  func setRate(_ rate: Float) {
    self.rate = rate
    self.clearIntervals()
  }

  func setVariability(_ variability: Float) {
    self.variability = variability
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
