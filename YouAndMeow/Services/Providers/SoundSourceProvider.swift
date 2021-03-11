//
//  SoundSourceProvider.swift
//  YouAndMeow
//
//  Created by Vladimir on 23.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class SoundSourceProvider {
  private init() {}

  static func getMeowingSoundSource() -> SoundSource {
    let meowingSoundFile = File(name: "Meowing", type: "m4a")
    let meowingSoundSource = SoundSource(file: meowingSoundFile)

    return meowingSoundSource
  }

  static func getInhalationSoundSource() -> SoundSource {
    let inhalationSoundFile = File(name: "Inhalation", type: "m4a")
    let inhalationSoundSource = SoundSource(file: inhalationSoundFile)

    return inhalationSoundSource
  }

  static func getExhalationSoundSource() -> SoundSource {
    let exhalationSoundFile = File(name: "Exhalation", type: "m4a")
    let exhalationSoundSource = SoundSource(file: exhalationSoundFile)

    return exhalationSoundSource
  }
}
