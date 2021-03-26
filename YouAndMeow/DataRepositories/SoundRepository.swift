//
//  SoundRepository.swift
//  YouAndMeow
//
//  Created by Vladimir on 23.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class SoundRepository {
  private init() {}

  static func getInhalationSoundPCMBuffer() throws -> AVAudioPCMBuffer {
    return try FileManager.readIntoPCMBuffer(resource: "Inhalation", withExtension: "m4a")
  }

  static func getExhalationSoundPCMBuffer() throws -> AVAudioPCMBuffer {
    return try FileManager.readIntoPCMBuffer(resource: "Exhalation", withExtension: "m4a")
  }

  static func getMeowingSoundByteBuffer() throws -> Data {
    return try FileManager.readIntoByteBuffer(resource: "Meowing", withExtension: "m4a")
  }
}
