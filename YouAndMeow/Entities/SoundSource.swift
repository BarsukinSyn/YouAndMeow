//
//  SoundSource.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

struct SoundSource {
  let file: File

  func readIntoByteBuffer() throws -> Data {
    return try FileManager.readIntoByteBuffer(resource: self.file.name, withExtension: self.file.type)
  }

  func readIntoPCMBuffer() throws -> AVAudioPCMBuffer {
    return try FileManager.readIntoPCMBuffer(resource: self.file.name, withExtension: self.file.type)
  }
}
