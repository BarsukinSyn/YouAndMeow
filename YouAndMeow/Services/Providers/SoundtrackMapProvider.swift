//
//  SoundtrackMapProvider.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class SoundtrackMapProvider {
  static func getMeowingsMap() throws -> SoundtrackMap {
    let meowingsMapSource = try FileManager.readIntoByteBuffer(resource: "MeowingsMap", withExtension: "plist")
    let meowingsMap = try DataDecoder.decodePropertyList(meowingsMapSource) as SoundtrackMap

    return meowingsMap
  }
}
