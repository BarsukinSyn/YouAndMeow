//
//  SoundPlayer.swift
//  YouAndMeow
//

import Foundation

protocol SoundPlayer: AnyObject {
  var delegate: SoundPlayerDelegate? { get set }

  func prepareToPlay() throws
  func play(fragment: SoundFragment, atVolume: Float)
  func stop()
}

protocol SoundPlayerDelegate: AnyObject {
  func playerJustFinishedPlaying(_ player: SoundPlayer)
}
