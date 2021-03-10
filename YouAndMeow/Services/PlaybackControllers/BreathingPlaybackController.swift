//
//  BreathingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol BreathingPlaybackSettings:
  DistanceSetting,
  RateSetting,
  SymmetrySetting,
  VariabilitySetting,
  VolumeSetting {
}

final class BreathingPlaybackController: PlaybackController, BreathingPlaybackSettings {
  @PlaybackSetting(minimumValue: 0.01, maximumValue: 1) private (set) var distance: Float = 0.505
  @PlaybackSetting(minimumValue: 20, maximumValue: 100) private (set) var rate: Float = 60
  @PlaybackSetting(minimumValue: -0.4, maximumValue: 0.4) private (set) var symmetry: Float = 0
  @PlaybackSetting(minimumValue: 0, maximumValue: 0.2) private (set) var variability: Float = 0.1
  @PlaybackSetting(minimumValue: 0, maximumValue: 1.5) private (set) var volume: Float = 1.5

  private let inhalationSoundPlayer: BreathingSoundPlayer
  private let exhalationSoundPlayer: BreathingSoundPlayer
  private let distanceProcessors: [DistanceProcessor]

  private var soundPlayers: [BreathingSoundPlayer] {
    [self.inhalationSoundPlayer, self.exhalationSoundPlayer]
  }

  init(
    withInhalationSoundPlayer inhalationSoundPlayer: BreathingSoundPlayer,
    andExhalationSoundPlayer exhalationSoundPlayer: BreathingSoundPlayer
  ) {
    let inhalationDistanceProcessor = DistanceProcessor()
    let exhalationDistanceProcessor = DistanceProcessor()

    inhalationSoundPlayer.attach(equalizer: inhalationDistanceProcessor.equalizer)
    exhalationSoundPlayer.attach(equalizer: exhalationDistanceProcessor.equalizer)

    self.inhalationSoundPlayer = inhalationSoundPlayer
    self.exhalationSoundPlayer = exhalationSoundPlayer
    self.distanceProcessors = [inhalationDistanceProcessor, exhalationDistanceProcessor]

    self.soundPlayers.forEach { $0.delegate = self }
  }

  func play() throws {
    let mockedVolumeLevel: Float = 1
    let mockedFragment = SoundFragment(start: 0, end: 1)

    try self.soundPlayers.forEach { try $0.prepareToPlay() }
    self.inhalationSoundPlayer.play(fragment: mockedFragment, atVolume: mockedVolumeLevel)
  }

  func stop() {
    self.soundPlayers.forEach { $0.stop() }
  }

  func updateDistance(_ distance: Float) {
    self.distance = distance
  }

  func updateRate(_ rate: Float) {
    self.rate = rate
  }

  func updateSymmetry(_ symmetry: Float) {
    self.symmetry = symmetry
  }

  func updateVariability(_ variability: Float) {
    self.variability = variability
  }

  func updateVolume(_ volume: Float) {
    self.volume = volume
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {}
}
