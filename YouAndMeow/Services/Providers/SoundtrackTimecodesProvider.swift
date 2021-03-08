//
//  SoundtrackTimecodesProvider.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class SoundtrackTimecodesProvider {
  static func getMeowingsTimecodes() throws -> SoundtrackTimecodes {
    let meowingsTimecodesSource = try FileManager.readIntoByteBuffer(
      resource: "MeowingsTimecodes",
      withExtension: "plist"
    )

    let meowingsTimecodes = try DataDecoder.decodePropertyList(meowingsTimecodesSource) as SoundtrackTimecodes

    return meowingsTimecodes
  }
}
