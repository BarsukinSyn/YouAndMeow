//
//  BreathingSoundFragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 05.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol BreathingSoundFragmentManagerSettings:
  RateSetting,
  VariabilitySetting {
}

final class BreathingSoundFragmentManager: BreathingSoundFragmentManagerSettings {
  @PlaybackSetting(minimumValue: 20, maximumValue: 100) private (set) var rate: Float = 60
  @PlaybackSetting(minimumValue: 0, maximumValue: 0.2) private (set) var variability: Float = 0.1

  private var rateSequence: [TimeInterval]

  private var defaultDuration: TimeInterval {
    self.rate > 0 ? TimeInterval(60 / self.rate / 2) : 0
  }

  init() {
    self.rateSequence = []
  }

  func updateRate(_ rate: Float) {
    self.rate = rate
    self.clearRateSequence()
  }

  func updateVariability(_ variability: Float) {
    self.variability = variability
    self.clearRateSequence()
  }

  func getSoundFragment() -> SoundFragment {
    let soundFragment = SoundFragment(start: 0, end: self.defaultDuration)

    return soundFragment
  }

  private func generateRateSequence() {}

  private func clearRateSequence() {
    self.rateSequence.removeAll()
  }
}
