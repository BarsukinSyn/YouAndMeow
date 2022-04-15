//
//  SoundRepository.swift
//  YouAndMeow
//

import AVFoundation

final class SoundRepository: StaticClass {
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
