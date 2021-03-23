//
//  BreathingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol BreathingPlaybackControllerDelegate: class {
  func breathingPlaybackCycleBegins()
}

final class BreathingPlaybackController: SoundPlayerDelegate {
  weak var delegate: BreathingPlaybackControllerDelegate?

  @LimitedValue(0.01 ... 1) private (set) var distance: Float = 0.505
  @LimitedValue(20 ... 100) private (set) var rate: Float = 60
  @LimitedValue(-0.4 ... 0.4) private (set) var symmetry: Float = 0
  @LimitedValue(0 ... 0.2) private (set) var variability: Float = 0.1
  @LimitedValue(0 ... 1) private (set) var volume: Float = 1

  private var isPlaying: Bool = false

  private let soundPlayers: BreathingPhases<BreathingSoundPlayer>
  private let fragmentManager: BreathingFragmentManager
  private let distanceProcessors: [DistanceProcessor]

  init(
    withPlayers soundPlayers: BreathingPhases<BreathingSoundPlayer>,
    andFragmentManager fragmentManager: BreathingFragmentManager
  ) {
    let distanceProcessors = Array(repeating: "", count: soundPlayers.list.count).map { (_) in DistanceProcessor() }

    self.soundPlayers = soundPlayers
    self.fragmentManager = fragmentManager
    self.distanceProcessors = distanceProcessors

    self.fragmentManager.setRate(self._rate)
    self.fragmentManager.setVariability(self._variability)
    self.soundPlayers.list.enumerated().forEach { (index, player) in
      player.delegate = self
      player.attach(equalizer: self.distanceProcessors[index].equalizer)
    }
  }

  func play() throws {
    if self.isPlaying { return }

    try self.soundPlayers.list.forEach { try $0.prepareToPlay() }
    self.playSound(from: self.soundPlayers.exhalation)
    self.isPlaying = true
  }

  func stop() {
    self.soundPlayers.list.forEach { $0.stop() }
    self.isPlaying = false
  }

  func setDistance(_ distance: Float) {
    self.distance = distance
    self.distanceProcessors.forEach { $0.setDistance(self.distance) }
  }

  func setRate(_ rate: Float) {
    self.rate = rate
    self.fragmentManager.setRate(self._rate)
  }

  func setSymmetry(_ symmetry: Float) {
    self.symmetry = symmetry
  }

  func setVariability(_ variability: Float) {
    self.variability = variability
    self.fragmentManager.setVariability(self._variability)
  }

  func setVolume(_ volume: Float) {
    self.volume = volume
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {
    if player === self.soundPlayers.exhalation {
      self.playSound(from: self.soundPlayers.inhalation)
    }

    if player === self.soundPlayers.inhalation {
      self.delegate?.breathingPlaybackCycleBegins()
      self.playSound(from: self.soundPlayers.exhalation)
    }
  }

  private func playSound(from player: BreathingSoundPlayer) {
    let soundFragment = self.fragmentManager.getRandomFragment()
    let playbackVolume = self.volume + (player === self.soundPlayers.inhalation ? -self.symmetry : self.symmetry)

    player.play(fragment: soundFragment, atVolume: playbackVolume)
  }
}
