//
//  SoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
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
