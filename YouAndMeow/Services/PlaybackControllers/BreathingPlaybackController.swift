//
//  BreathingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol BreathingPlaybackControllerDelegate: class {
  func breathingCycleBegins()
}

final class BreathingPlaybackController: SoundPlayerDelegate {
  weak var delegate: BreathingPlaybackControllerDelegate?

  private var isPlaying: Bool = false
  @LimitedValue(0.01 ... 1) private (set) var distance: Float = 0.505
  @LimitedValue(20 ... 100) private (set) var rate: Float = 60
  @LimitedValue(-0.4 ... 0.4) private (set) var symmetry: Float = 0
  @LimitedValue(0 ... 0.2) private (set) var variability: Float = 0.1
  @LimitedValue(0 ... 1) private (set) var volume: Float = 1

  private let inhalationSoundPlayer: BreathingSoundPlayer
  private let exhalationSoundPlayer: BreathingSoundPlayer
  private let breathingFragmentManager: BreathingFragmentManager
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
    let breathingFragmentManager = FragmentManagerCreator.createBreathingFragmentManager()

    inhalationSoundPlayer.attach(equalizer: inhalationDistanceProcessor.equalizer)
    exhalationSoundPlayer.attach(equalizer: exhalationDistanceProcessor.equalizer)

    self.inhalationSoundPlayer = inhalationSoundPlayer
    self.exhalationSoundPlayer = exhalationSoundPlayer
    self.breathingFragmentManager = breathingFragmentManager
    self.distanceProcessors = [inhalationDistanceProcessor, exhalationDistanceProcessor]

    self.soundPlayers.forEach { $0.delegate = self }
    self.breathingFragmentManager.setRate(self._rate)
    self.breathingFragmentManager.setVariability(self._variability)
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

  func setDistance(_ distance: Float) {
    self.distance = distance
    self.distanceProcessors.forEach { $0.setDistance(self.distance) }
  }

  func setRate(_ rate: Float) {
    self.rate = rate
    self.breathingFragmentManager.setRate(self._rate)
  }

  func setSymmetry(_ symmetry: Float) {
    self.symmetry = symmetry
  }

  func setVariability(_ variability: Float) {
    self.variability = variability
    self.breathingFragmentManager.setVariability(self._variability)
  }

  func setVolume(_ volume: Float) {
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
    let soundFragment = self.breathingFragmentManager.getFragment()
    let playbackVolume = self.volume + (player === self.inhalationSoundPlayer ? -self.symmetry : self.symmetry)

    player.play(fragment: soundFragment, atVolume: playbackVolume)
  }
}
