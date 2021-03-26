//
//  IntervalsRepository.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//

import Foundation

final class IntervalsRepository {
  private init() {}

  static func getMeowingIntervals() throws -> [TimeInterval] {
    let sourceBuffer = try FileManager.readIntoByteBuffer(resource: "MeowingIntervals", withExtension: "plist")
    let meowingIntervals = try DataDecoder.decodePropertyList(sourceBuffer) as [TimeInterval]

    return meowingIntervals
  }
}