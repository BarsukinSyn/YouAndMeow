//
//  MeowingPlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//

import Foundation

protocol MeowingPlaybackControllerDelegate: class {
  func meowingPlaybackFinished()
}

final class MeowingPlaybackController: SoundPlayerDelegate {
  weak var delegate: MeowingPlaybackControllerDelegate?

  @Bounded(PlaybackSystemSettingsBounds.distance) private (set) var distance: Float
  @Bounded(PlaybackSystemSettingsBounds.meowingRate) private (set) var rate: Float
  @Bounded(PlaybackSystemSettingsBounds.volume) private (set) var volume: Float

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
    let soundFragment = self.fragmentManager.getRandomFragment()

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
