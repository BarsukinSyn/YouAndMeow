//
//  BreathingSoundProcessor.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class BreathingSoundProcessor {
  let distanceProcessors: [BreathingPhase: DistanceProcessor]

  init() {
    let inhalationDistanceProcessor = DistanceProcessor()
    let exhalationDistanceProcessor = DistanceProcessor()

    self.distanceProcessors = [
      .inhalation: inhalationDistanceProcessor,
      .exhalation: exhalationDistanceProcessor
    ]
  }

  func setDistance(_ distance: Float) {
    self.distanceProcessors.values.forEach { $0.setDistance(distance) }
  }
}
