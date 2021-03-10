//
//  MeowingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol MeowingPlaybackSettings:
  RateSetting,
  VolumeSetting {
}

final class MeowingPlaybackController: PlaybackController, MeowingPlaybackSettings {
  @PlaybackSetting(minimumValue: 0, maximumValue: 4) private (set) var rate: Float = 2
  @PlaybackSetting(minimumValue: 0, maximumValue: 1) private (set) var volume: Float = 1

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

  func reset() {
    self.updateRate(self._rate.averageValue)
    self.updateVolume(self._volume.maximumValue)
  }

  func updateRate(_ rate: Float) {
    self.rate = rate
  }

  func updateVolume(_ volume: Float) {
    self.volume = volume
  }
}
