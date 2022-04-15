//
//  IntervalsRepository.swift
//  YouAndMeow
//

import Foundation

final class IntervalsRepository: StaticClass {
  static func getMeowingIntervals() throws -> [TimeInterval] {
    let sourceBuffer = try FileManager.readIntoByteBuffer(resource: "MeowingIntervals", withExtension: "plist")
    let meowingIntervals = try DataDecoder.decodePropertyList(sourceBuffer) as [TimeInterval]

    return meowingIntervals
  }
}
