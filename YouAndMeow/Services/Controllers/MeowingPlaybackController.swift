//
//  MeowingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class MeowingPlaybackController {
  @LimitedValue(0 ... 4) private (set) var rate: Float = 2
  @LimitedValue(0 ... 1) private (set) var volume: Float = 1

  private let soundPlayer: MeowingSoundPlayer
  private let fragmentManager: MeowingFragmentManager

  init(withPlayer soundPlayer: MeowingSoundPlayer, andFragmentManager fragmentManager: MeowingFragmentManager) {
    self.soundPlayer = soundPlayer
    self.fragmentManager = fragmentManager
  }

  func play() {
    let soundFragment = self.fragmentManager.getFragment()

    self.soundPlayer.play(fragment: soundFragment, atVolume: self.volume)
  }

  func stop() {
    self.soundPlayer.stop()
  }

  func setRate(_ rate: Float) {
    self.rate = rate
  }

  func setVolume(_ volume: Float) {
    self.volume = volume
  }
}
