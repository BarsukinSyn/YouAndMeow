//
//  MeowingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol MeowingPlaybackControllerDelegate: class {
  func meowingPlaybackFinished()
}

final class MeowingPlaybackController: SoundPlayerDelegate {
  weak var delegate: MeowingPlaybackControllerDelegate?

  @LimitedValue(0.01 ... 1) private (set) var distance: Float = 0.505
  @LimitedValue(0 ... 4) private (set) var rate: Float = 2
  @LimitedValue(0 ... 1) private (set) var volume: Float = 1

  private var playbackVolume: Float {
    self.volume - self.distance * 0.8
  }

  private let soundPlayer: MeowingSoundPlayer
  private let fragmentManager: MeowingFragmentManager

  init(withPlayer soundPlayer: MeowingSoundPlayer, andFragmentManager fragmentManager: MeowingFragmentManager) {
    self.soundPlayer = soundPlayer
    self.fragmentManager = fragmentManager

    self.soundPlayer.delegate = self
  }

  func play() {
    let soundFragment = self.fragmentManager.getFragment()

    self.soundPlayer.play(fragment: soundFragment, atVolume: self.playbackVolume)
  }

  func stop() {
    self.soundPlayer.stop()
  }

  func setDistance(_ distance: Float) {
    self.distance = distance
  }

  func setRate(_ rate: Float) {
    self.rate = rate
  }

  func setVolume(_ volume: Float) {
    self.volume = volume
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {
    self.delegate?.meowingPlaybackFinished()
  }
}
