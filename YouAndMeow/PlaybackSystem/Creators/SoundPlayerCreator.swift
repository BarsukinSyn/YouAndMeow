//
//  SoundPlayerCreator.swift
//  YouAndMeow
//

import Foundation

final class SoundPlayerCreator: StaticClass {
  static func createInhalationSoundPlayer() throws -> BreathingSoundPlayer {
    let inhalationSoundBuffer = try SoundRepository.getInhalationSoundPCMBuffer()
    let inhalationSoundPlayer = BreathingSoundPlayer(withInput: inhalationSoundBuffer)

    return inhalationSoundPlayer
  }

  static func createExhalationSoundPlayer() throws -> BreathingSoundPlayer {
    let exhalationSoundBuffer = try SoundRepository.getExhalationSoundPCMBuffer()
    let exhalationSoundPlayer = BreathingSoundPlayer(withInput: exhalationSoundBuffer)

    return exhalationSoundPlayer
  }

  static func createMeowingSoundPlayer() throws -> MeowingSoundPlayer {
    let meowingSoundBuffer = try SoundRepository.getMeowingSoundByteBuffer()
    let meowingSoundPlayer = try MeowingSoundPlayer(withInput: meowingSoundBuffer)

    return meowingSoundPlayer
  }
}
