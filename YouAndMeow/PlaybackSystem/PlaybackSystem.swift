//
//  CatSoundPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 26.06.2020.
//

import Foundation

final class PlaybackSystem: BreathingPlaybackControllerDelegate, MeowingPlaybackControllerDelegate {
  @LimitedValue(PlaybackSystemSettingBounds.volume) private (set) var volume: Float = 1

  private var muffledBreathingPlaybackVolume: Float {
    self.volume / 2
  }

  private let breathingPlaybackController: BreathingPlaybackController
  private let meowingPlaybackController: MeowingPlaybackController
  private let playMeowingSound: VoidFunction

  init() throws {
    let breathingPlaybackController = try PlaybackControllerCreator.createBreathingPlaybackController()
    let meowingPlaybackController = try PlaybackControllerCreator.createMeowingPlaybackController()
    let throttledMeowingPlaybackMethod = Timer.throttle(wait: 5, action: meowingPlaybackController.play)

    self.breathingPlaybackController = breathingPlaybackController
    self.meowingPlaybackController = meowingPlaybackController
    self.playMeowingSound = throttledMeowingPlaybackMethod

    self.breathingPlaybackController.delegate = self
    self.meowingPlaybackController.delegate = self
  }

  func play() throws {
    try self.breathingPlaybackController.play()
  }

  func stop() {
    self.breathingPlaybackController.stop()
    self.meowingPlaybackController.stop()
  }

  func setBreathingRate(_ rate: Float) {
    self.breathingPlaybackController.setRate(rate)
  }

  func setDistance(_ distance: Float) {
    self.breathingPlaybackController.setDistance(distance)
    self.meowingPlaybackController.setDistance(distance)
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
    self.volume = volume

    self.breathingPlaybackController.setVolume(volume)
    self.meowingPlaybackController.setVolume(volume)
  }

  func breathingPlaybackCycleBegins() {
    if self.shouldPlayMeowingSound(threshold: .random(in: 0 ... 1)) {
      self.breathingPlaybackController.setVolume(self.muffledBreathingPlaybackVolume)
      self.playMeowingSound()
    }
  }

  func meowingPlaybackFinished() {
    self.breathingPlaybackController.setVolume(self.volume)
  }

  private func shouldPlayMeowingSound(threshold: Float) -> Bool {
    let meowingRate = self.meowingPlaybackController.rate
    let breathingRate = self.breathingPlaybackController.rate
    let meowingRateIsPositive = meowingRate > 0
    let thresholdIsExceeded = (meowingRate / breathingRate) > threshold

    return meowingRateIsPositive && thresholdIsExceeded
  }
}
