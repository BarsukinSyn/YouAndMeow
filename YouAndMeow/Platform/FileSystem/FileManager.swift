//
//  FileManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 19.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

class FileManager {
  typealias Exception = FileManagerException

  static func getURL(forResource name: String, withExtension ext: String) throws -> URL {
    guard let url = Bundle.main.url(forResource: name, withExtension: ext)
      else { throw FileManager.Exception.resourceError }

    return url
  }

  static func readIntoByteBuffer(resource name: String, withExtension ext: String) throws -> Data {
    let url = try FileManager.getURL(forResource: name, withExtension: ext)

    do {
      let data = try Data(contentsOf: url)

      return data
    } catch {
      throw FileManager.Exception.fileReadingError
    }
  }

  static func readIntoPCMBuffer(resource name: String, withExtension ext: String) throws -> AVAudioPCMBuffer {
    let url = try FileManager.getURL(forResource: name, withExtension: ext)

    do {
      let data = try AVAudioFile(forReading: url)

      guard let buffer = AVAudioPCMBuffer(pcmFormat: data.processingFormat, frameCapacity: UInt32(data.length))
        else { throw FileManager.Exception.fileReadingError }

      try data.read(into: buffer)

      return buffer
    } catch {
      throw FileManager.Exception.fileReadingError
    }
  }
}

enum FileManagerException: Error {
  case resourceError
  case fileReadingError
}

