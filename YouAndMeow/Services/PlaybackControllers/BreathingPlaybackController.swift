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

protocol BreathingPlaybackControllerDelegate {
  func breathingCycleBegins()
}

final class BreathingPlaybackController: PlaybackController, BreathingPlaybackSettings, SoundPlayerDelegate {
  @PlaybackSetting(minimumValue: 0.01, maximumValue: 1) private (set) var distance: Float = 0.505
  @PlaybackSetting(minimumValue: 20, maximumValue: 100) private (set) var rate: Float = 60
  @PlaybackSetting(minimumValue: -0.4, maximumValue: 0.4) private (set) var symmetry: Float = 0
  @PlaybackSetting(minimumValue: 0, maximumValue: 0.2) private (set) var variability: Float = 0.1
  @PlaybackSetting(minimumValue: 0, maximumValue: 1) private (set) var volume: Float = 1

  var delegate: BreathingPlaybackControllerDelegate?

  private var isPlaying: Bool
  private let inhalationSoundPlayer: BreathingSoundPlayer
  private let exhalationSoundPlayer: BreathingSoundPlayer
  private let breathingSoundFragmentManager: BreathingSoundFragmentManager
  private let distanceProcessors: [DistanceProcessor]

  private var soundPlayers: [BreathingSoundPlayer] {
    [self.inhalationSoundPlayer, self.exhalationSoundPlayer]
  }

  init(
    withInhalationPlayer inhalationSoundPlayer: BreathingSoundPlayer,
    andExhalationPlayer exhalationSoundPlayer: BreathingSoundPlayer
  ) {
    let inhalationDistanceProcessor = DistanceProcessor()
    let exhalationDistanceProcessor = DistanceProcessor()

    inhalationSoundPlayer.attach(equalizer: inhalationDistanceProcessor.equalizer)
    exhalationSoundPlayer.attach(equalizer: exhalationDistanceProcessor.equalizer)

    self.isPlaying = false
    self.inhalationSoundPlayer = inhalationSoundPlayer
    self.exhalationSoundPlayer = exhalationSoundPlayer
    self.breathingSoundFragmentManager = BreathingSoundFragmentManager()
    self.distanceProcessors = [inhalationDistanceProcessor, exhalationDistanceProcessor]

    self.soundPlayers.forEach { $0.delegate = self }
  }

  func play() throws {
    if self.isPlaying { return }

    try self.soundPlayers.forEach { try $0.prepareToPlay() }
    self.playSound(from: self.exhalationSoundPlayer)
    self.isPlaying = true
  }

  func stop() {
    self.soundPlayers.forEach { $0.stop() }
    self.isPlaying = false
  }

  func reset() {
    self.updateDistance(self._distance.averageValue)
    self.updateRate(self._rate.averageValue)
    self.updateSymmetry(self._symmetry.averageValue)
    self.updateVariability(self._variability.averageValue)
    self.updateVolume(self._volume.maximumValue)
  }

  func updateDistance(_ distance: Float) {
    self.distance = distance
    self.distanceProcessors.forEach { $0.setDistance(self.distance) }
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

  func playerJustFinishedPlaying(_ player: SoundPlayer) {
    if player as AnyObject === self.exhalationSoundPlayer {
      self.playSound(from: self.inhalationSoundPlayer)
    }

    if player as AnyObject === self.inhalationSoundPlayer {
      self.delegate?.breathingCycleBegins()
      self.playSound(from: self.exhalationSoundPlayer)
    }
  }

  private func playSound(from player: BreathingSoundPlayer) {
    let soundFragment = self.breathingSoundFragmentManager.getSoundFragment()
    let playbackVolume = self.volume + (player === self.inhalationSoundPlayer ? -self.symmetry : self.symmetry)

    player.play(fragment: soundFragment, atVolume: playbackVolume)
  }
}
