//
//  SoundPlayerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class SoundPlayerCreator {
  private init() {}

  static func createInhalationSoundPlayer() throws -> BreathingSoundPlayer {
    let inhalationSoundSource = SoundSourceProvider.getInhalationSoundSource()
    let inhalationSoundPlayer = try BreathingSoundPlayer(withSource: inhalationSoundSource)

    return inhalationSoundPlayer
  }

  static func createExhalationSoundPlayer() throws -> BreathingSoundPlayer {
    let exhalationSoundSource = SoundSourceProvider.getExhalationSoundSource()
    let exhalationSoundPlayer = try BreathingSoundPlayer(withSource: exhalationSoundSource)

    return exhalationSoundPlayer
  }

  static func createMeowingSoundPlayer() throws -> MeowingSoundPlayer {
    let meowingSoundSource = SoundSourceProvider.getMeowingSoundSource()
    let meowingSoundPlayer = try MeowingSoundPlayer(withSource: meowingSoundSource)

    return meowingSoundPlayer
  }
}
