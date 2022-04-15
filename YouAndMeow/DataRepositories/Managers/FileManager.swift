//
//  FileManager.swift
//  YouAndMeow
//

import AVFoundation

final class FileManager: StaticClass {
  static func getURL(forResource name: String, withExtension ext: String) throws -> URL {
    guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
      throw FileManager.Exception.fileNotFound
    }

    return url
  }

  static func readIntoByteBuffer(resource name: String, withExtension ext: String) throws -> Data {
    let url = try FileManager.getURL(forResource: name, withExtension: ext)

    do {
      let data = try Data(contentsOf: url)

      return data
    } catch {
      throw FileManager.Exception.fileCannotBeRead
    }
  }

  static func readIntoPCMBuffer(resource name: String, withExtension ext: String) throws -> AVAudioPCMBuffer {
    let url = try FileManager.getURL(forResource: name, withExtension: ext)

    do {
      let data = try AVAudioFile(forReading: url)

      guard let buffer = AVAudioPCMBuffer(pcmFormat: data.processingFormat, frameCapacity: UInt32(data.length)) else {
        throw FileManager.Exception.fileCannotBeRead
      }

      try data.read(into: buffer)

      return buffer
    } catch {
      throw FileManager.Exception.fileCannotBeRead
    }
  }
}

extension FileManager {
  enum Exception: Error {
    case fileNotFound
    case fileCannotBeRead
  }
}

