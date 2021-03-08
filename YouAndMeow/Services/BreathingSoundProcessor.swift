//
//  BreathingSoundProcessor.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class BreathingSoundProcessor {
  let equalizer: AVAudioUnitEQ

  private var lowShelfFilter: AVAudioUnitEQFilterParameters
  private var parametricFilter: AVAudioUnitEQFilterParameters

  init() {
    let equalizer = AVAudioUnitEQ(numberOfBands: 2)
    let lowShelfFilter = equalizer.bands[0]
    let parametricFilter = equalizer.bands[1]

    lowShelfFilter.filterType = AVAudioUnitEQFilterType.lowShelf
    lowShelfFilter.bypass = false

    parametricFilter.filterType = AVAudioUnitEQFilterType.parametric
    parametricFilter.bandwidth = 0.5
    parametricFilter.bypass = false

    self.equalizer = equalizer
    self.lowShelfFilter = lowShelfFilter
    self.parametricFilter = parametricFilter
  }

  func setDistance(_ distance: Float) {
    let lowShelfFrequency = round(powf(distance, 2) * 300)
    var lowShelfGain, parametricGain, parametricFrequency: Float

    if distance < 0.5 {
      lowShelfGain = 0
      parametricGain = -(0.5 - distance) * 36
      parametricFrequency = round(20000 - (0.5 - distance) * 40000)
    } else {
      lowShelfGain = -18 - (distance - 0.5) * 24
      parametricGain = -(distance - 0.5) * 12
      parametricFrequency = round(20000 - (distance - 0.5) * 38000)
    }

    self.lowShelfFilter.gain = lowShelfGain
    self.lowShelfFilter.frequency = lowShelfFrequency

    self.parametricFilter.gain = parametricGain
    self.parametricFilter.frequency = parametricFrequency
  }
}
