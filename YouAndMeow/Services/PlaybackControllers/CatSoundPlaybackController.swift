//
//  CatSoundPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class CatSoundPlaybackController: BreathingPlaybackControllerDelegate {
  private let breathingPlaybackController: BreathingPlaybackController
  private let meowingPlaybackController: MeowingPlaybackController

  init() throws {
    let inhalationSoundPlayer = try SoundPlayerCreator.createInhalationSoundPlayer()
    let exhalationSoundPlayer = try SoundPlayerCreator.createExhalationSoundPlayer()
    let meowingSoundPlayer = try SoundPlayerCreator.createMeowingSoundPlayer()
    let meowingPlaybackController = try MeowingPlaybackController(withPlayer: meowingSoundPlayer)
    let breathingPlaybackController = BreathingPlaybackController(
      withInhalationPlayer: inhalationSoundPlayer,
      andExhalationPlayer: exhalationSoundPlayer
    )

    self.breathingPlaybackController = breathingPlaybackController
    self.meowingPlaybackController = meowingPlaybackController

    self.breathingPlaybackController.delegate = self
  }

  func play() {
    try? self.breathingPlaybackController.play()
  }

  func breathingCycleBegins() {
    if self.shouldPlayMeowingSound(threshold: Float.random(in: 0 ... 1)) {
      self.meowingPlaybackController.play()
    }
  }

  private func shouldPlayMeowingSound(threshold: Float) -> Bool {
    let meowingRate = self.meowingPlaybackController.rate
    let breathingRate = self.breathingPlaybackController.rate

    return meowingRate > 0 && (meowingRate / breathingRate) > threshold
  }
}
