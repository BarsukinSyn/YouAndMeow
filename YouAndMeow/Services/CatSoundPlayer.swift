//
//  CatSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class CatSoundPlayer: SoundPlayerDelegate {
  private let breathingSoundPlayer: BreathingSoundPlayer
  private let breathingSoundProcessor: BreathingSoundProcessor
  private let meowingSoundPlayer: MeowingSoundPlayer
  private let meowingsTimecodesManager: TimecodesManager

  init() throws {
    let breathingSoundProcessor = BreathingSoundProcessor()
    let breathingSoundPlayer = try SoundPlayerCreator.createBreathingSoundPlayer(withProcessor: breathingSoundProcessor)
    let meowingSoundPlayer = try SoundPlayerCreator.createMeowingSoundPlayer()
    let meowingsTimecodesManager = try TimecodesManagerCreator.createMeowingsTimecodesManager()

    self.breathingSoundPlayer = breathingSoundPlayer
    self.breathingSoundProcessor = breathingSoundProcessor
    self.meowingSoundPlayer = meowingSoundPlayer
    self.meowingsTimecodesManager = meowingsTimecodesManager

    self.breathingSoundPlayer.delegate = self
    self.meowingSoundPlayer.delegate = self
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {}

  private func playBreathingSound() {
    let duration = SoundFragment(start: 0, end: 1)

    self.breathingSoundPlayer.play(fragment: duration)
  }

  private func playMeowingSound() {
    let randomSoundFragment = self.meowingsTimecodesManager.getRandomSoundFragment()

    self.meowingSoundPlayer.play(fragment: randomSoundFragment)
  }
}
