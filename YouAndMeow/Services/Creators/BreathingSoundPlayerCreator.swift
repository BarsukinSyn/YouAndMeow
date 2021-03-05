//
//  BreathingSoundPlayerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class BreathingSoundPlayerCreator: SoundPlayerCreator {
  static func create() throws -> BreathingSoundPlayer {
    let inhalationSoundSource = SoundSourceProvider.getInhalationSoundSource()
    let exhalationSoundSource = SoundSourceProvider.getExhalationSoundSource()

    let breathingSoundPlayer = try BreathingSoundPlayer(breathingPhaseSoundSources: [
      .inhalation: inhalationSoundSource,
      .exhalation: exhalationSoundSource
    ])

    return breathingSoundPlayer
  }
}
