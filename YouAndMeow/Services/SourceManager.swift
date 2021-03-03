//
//  SourceManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 23.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class SourceManager {
  static func getMeowingSoundSource() -> Source {
    let meowingSoundFile = File(name: "meowing", type: "m4a")
    let meowingSoundSource = Source(file: meowingSoundFile)

    return meowingSoundSource
  }

  static func getInhalationSoundSource() -> Source {
    let inhalationSoundFile = File(name: "inhalation", type: "m4a")
    let inhalationSoundSource = Source(file: inhalationSoundFile)

    return inhalationSoundSource
  }

  static func getExhalationSoundSource() -> Source {
    let exhalationSoundFile = File(name: "exhalation", type: "m4a")
    let exhalationSoundSource = Source(file: exhalationSoundFile)

    return exhalationSoundSource
  }
}
