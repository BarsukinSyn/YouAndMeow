//
//  SoundPlayerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class SoundPlayerCreator {
  static func createBreathingSoundPlayer(
    withProcessor soundProcessor: BreathingSoundProcessor
  ) throws -> BreathingSoundPlayer {
    let inhalationSoundSource = SoundSourceProvider.getInhalationSoundSource()
    let exhalationSoundSource = SoundSourceProvider.getExhalationSoundSource()
    let breathingSoundPlayer = try BreathingSoundPlayer(breathingPhaseSoundSources: [
      .inhalation: inhalationSoundSource,
      .exhalation: exhalationSoundSource
    ])

    breathingSoundPlayer.attach(equalizers: soundProcessor.distanceProcessors.mapValues { $0.equalizer })

    return breathingSoundPlayer
  }

  static func createMeowingSoundPlayer() throws -> MeowingSoundPlayer {
    let meowingSoundSource = SoundSourceProvider.getMeowingSoundSource()
    let meowingSoundPlayer = try MeowingSoundPlayer(withSource: meowingSoundSource)

    return meowingSoundPlayer
  }
}
