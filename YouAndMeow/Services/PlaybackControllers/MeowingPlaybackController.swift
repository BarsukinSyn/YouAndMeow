//
//  MeowingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class MeowingPlaybackController: PlaybackController {
  @LimitedValue(0 ... 4) private var rate: Float = 2
  @LimitedValue(0 ... 1) private var volume: Float = 1

  private let soundPlayer: MeowingSoundPlayer
  private let timecodesManager: TimecodesManager

  init(withPlayer soundPlayer: MeowingSoundPlayer) throws {
    let timecodesManager = try TimecodesManagerCreator.createMeowingsTimecodesManager()

    self.soundPlayer = soundPlayer
    self.timecodesManager = timecodesManager
  }

  func play() {
    let mockedVolumeLevel: Float = 1
    let randomSoundFragment = self.timecodesManager.getRandomSoundFragment()

    self.soundPlayer.play(fragment: randomSoundFragment, atVolume: mockedVolumeLevel)
  }

  func stop() {
    self.soundPlayer.stop()
  }

  func updateRate(_ rate: Float) {
    self.rate = rate
  }

  func updateVolume(_ volume: Float) {
    self.volume = volume
  }
}
