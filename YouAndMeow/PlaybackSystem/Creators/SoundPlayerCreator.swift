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
    let inhalationSoundBuffer = try SoundProvider.getInhalationSoundPCMBuffer()
    let inhalationSoundPlayer = BreathingSoundPlayer(withInput: inhalationSoundBuffer)

    return inhalationSoundPlayer
  }

  static func createExhalationSoundPlayer() throws -> BreathingSoundPlayer {
    let exhalationSoundBuffer = try SoundProvider.getExhalationSoundPCMBuffer()
    let exhalationSoundPlayer = BreathingSoundPlayer(withInput: exhalationSoundBuffer)

    return exhalationSoundPlayer
  }

  static func createMeowingSoundPlayer() throws -> MeowingSoundPlayer {
    let meowingSoundBuffer = try SoundProvider.getMeowingSoundByteBuffer()
    let meowingSoundPlayer = try MeowingSoundPlayer(withInput: meowingSoundBuffer)

    return meowingSoundPlayer
  }
}
