//
//  SoundProvider.swift
//  YouAndMeow
//
//  Created by Vladimir on 23.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class SoundProvider {
  private init() {}

  static func getInhalationSoundPCMBuffer() throws -> AVAudioPCMBuffer {
    let inhalationSoundBuffer = try FileManager.readIntoPCMBuffer(resource: "Inhalation", withExtension: "m4a")

    return inhalationSoundBuffer
  }

  static func getExhalationSoundPCMBuffer() throws -> AVAudioPCMBuffer {
    let exhalationSoundBuffer = try FileManager.readIntoPCMBuffer(resource: "Exhalation", withExtension: "m4a")

    return exhalationSoundBuffer
  }

  static func getMeowingSoundByteBuffer() throws -> Data {
    let meowingSoundBuffer = try FileManager.readIntoByteBuffer(resource: "Meowing", withExtension: "m4a")

    return meowingSoundBuffer
  }
}
