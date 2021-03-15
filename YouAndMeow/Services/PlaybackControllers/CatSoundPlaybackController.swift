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
  private let playMeowingSound: VoidFunction

  init() throws {
    let breathingPlaybackController = try PlaybackControllerCreator.createBreathingPlaybackController()
    let meowingPlaybackController = try PlaybackControllerCreator.createMeowingPlaybackController()
    let throttledMeowingPlayback = Timer.throttle(wait: 5, action: meowingPlaybackController.play)

    self.breathingPlaybackController = breathingPlaybackController
    self.meowingPlaybackController = meowingPlaybackController
    self.playMeowingSound = throttledMeowingPlayback

    self.breathingPlaybackController.delegate = self
  }

  func play() throws {
    try self.breathingPlaybackController.play()
  }

  func stop() {
    self.breathingPlaybackController.stop()
    self.meowingPlaybackController.stop()
  }

  func setDistance(_ distance: Float) {
    self.breathingPlaybackController.setDistance(distance)
  }

  func setBreathingRate(_ rate: Float) {
    self.breathingPlaybackController.setRate(rate)
  }

  func setMeowingRate(_ rate: Float) {
    self.meowingPlaybackController.setRate(rate)
  }

  func setSymmetry(_ symmetry: Float) {
    self.breathingPlaybackController.setSymmetry(symmetry)
  }

  func setVariability(_ variability: Float) {
    self.breathingPlaybackController.setVariability(variability)
  }

  func setVolume(_ volume: Float) {
    self.breathingPlaybackController.setVolume(volume)
    self.meowingPlaybackController.setVolume(volume)
  }

  func breathingCycleBegins() {
    if self.shouldPlayMeowingSound(threshold: .random(in: 0 ... 1)) {
      self.playMeowingSound()
    }
  }

  private func shouldPlayMeowingSound(threshold: Float) -> Bool {
    let meowingRate = self.meowingPlaybackController.rate
    let breathingRate = self.breathingPlaybackController.rate

    return meowingRate > 0 && (meowingRate / breathingRate) > threshold
  }
}
