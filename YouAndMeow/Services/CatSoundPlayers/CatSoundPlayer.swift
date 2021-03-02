//
//  CatSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol CatSoundPlayer {
  var delegate: CatSoundPlayerDelegate? { get set }

  func prepareToPlay() throws
  func play(fragment: SoundFragment)
  func stop()
}

protocol CatSoundPlayerDelegate {
  func playerJustFinishedPlaying(_ player: CatSoundPlayer)
}
