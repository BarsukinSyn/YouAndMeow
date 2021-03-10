//
//  CatSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class CatSoundPlayer {
  private let breathingPlaybackController: BreathingPlaybackController
  private let meowingPlaybackController: MeowingPlaybackController

  init() throws {
    let inhalationSoundPlayer = try SoundPlayerCreator.createInhalationSoundPlayer()
    let exhalationSoundPlayer = try SoundPlayerCreator.createExhalationSoundPlayer()
    let meowingSoundPlayer = try SoundPlayerCreator.createMeowingSoundPlayer()
    let meowingPlaybackController = try MeowingPlaybackController(withPlayer: meowingSoundPlayer)
    let breathingPlaybackController = BreathingPlaybackController(
      withInhalationSoundPlayer: inhalationSoundPlayer,
      andExhalationSoundPlayer: exhalationSoundPlayer
    )

    self.breathingPlaybackController = breathingPlaybackController
    self.meowingPlaybackController = meowingPlaybackController
  }

  func play() {
    try? self.breathingPlaybackController.play()
  }
}
