//
//  AppAudioPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class AppAudioPlayer: SoundPlayerDelegate {
  private let meowingSoundPlayer: MeowingSoundPlayer
  private let meowingsTimecodesManager: SoundtrackTimecodesManager

  init() throws {
    let meowingSoundPlayer = try SoundPlayerCreator.createMeowingSoundPlayer()
    let meowingsTimecodes = try SoundtrackTimecodesProvider.getMeowingsTimecodes()

    self.meowingSoundPlayer = meowingSoundPlayer
    self.meowingsTimecodesManager = SoundtrackTimecodesManager(meowingsTimecodes)

    self.meowingSoundPlayer.delegate = self
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {}

  private func playMeowingSound() {
    let randomSoundFragment = self.meowingsTimecodesManager.getRandomSoundFragment()

    self.meowingSoundPlayer.play(fragment: randomSoundFragment)
  }
}
