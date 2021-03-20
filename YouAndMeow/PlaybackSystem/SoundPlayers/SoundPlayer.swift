//
//  SoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol SoundPlayer: class {
  var delegate: SoundPlayerDelegate? { get set }

  func prepareToPlay() throws
  func play(fragment: SoundFragment, atVolume: Float)
  func stop()
}

protocol SoundPlayerDelegate: class {
  func playerJustFinishedPlaying(_ player: SoundPlayer)
}
