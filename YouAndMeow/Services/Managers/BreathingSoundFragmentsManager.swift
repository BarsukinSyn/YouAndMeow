//
//  BreathingSoundFragmentsManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 05.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class BreathingSoundFragmentsManager {
  private var fragmentSequence: [SoundFragment] = []
  @LimitedValue(0 ... 0) private var rate: Float = 0
  @LimitedValue(0 ... 0) private var variability: Float = 0

  private var defaultDuration: TimeInterval {
    self.rate > 0 ? TimeInterval(60 / self.rate / 2) : 0
  }

  private var defaultSoundFragment: SoundFragment {
    SoundFragment(start: 0, end: self.defaultDuration)
  }

  private var shouldUpdateFragmentSequence: Bool {
    self.fragmentSequence.isEmpty && self.variability > 0 && self.variability > Float.random(in: 0 ... 1)
  }

  func updateRate(_ rate: LimitedValue<Float>) {
    self._rate = rate
    self.clearFragmentSequence()
  }

  func updateVariability(_ variability: LimitedValue<Float>) {
    self._variability = variability
    self.clearFragmentSequence()
  }

  func getNextSoundFragment() -> SoundFragment {
    if self.shouldUpdateFragmentSequence {
      self.updateFragmentSequence()
    }

    return self.fragmentSequence.popLast() ?? self.defaultSoundFragment
  }

  private func updateFragmentSequence() {
    let fragmentSequenceLength = Int.random(in: 3 ... 8)
    let fragmentSequence = self.generateFragmentSequence(length: fragmentSequenceLength)

    self.fragmentSequence = fragmentSequence
  }

  private func clearFragmentSequence() {
    self.fragmentSequence.removeAll()
  }

  private func generateFragmentSequence(length: Int) -> [SoundFragment] {
    var fragmentSequence: [SoundFragment] = []
    var durationScale = Double.random(in: 0.85...1)

    let rateLimit = self._rate.limit
    let rateRatio = (self.rate - rateLimit.lowerBound) / (rateLimit.upperBound - rateLimit.lowerBound)

    switch rateRatio {
    case 0...0.4:
      durationScale -= 0.25
    case 0.8...1:
      durationScale += 0.75
    default:
      durationScale += Bool.random() ? 0.35 : 0
    }

    for _ in 1 ... length {
      let fragmentDuration = self.defaultDuration * durationScale * Double.random(in: 0.85...1)
      let soundFragment = SoundFragment(start: 0, end: fragmentDuration)

      fragmentSequence.append(soundFragment)
    }

    return fragmentSequence
  }
}
