//
//  MeowingSoundPlayerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class MeowingSoundPlayerCreator: SoundPlayerCreator {
  static func create() throws -> MeowingSoundPlayer {
    let meowingSoundSource = SoundSourceProvider.getMeowingSoundSource()
    let meowingSoundPlayer = try MeowingSoundPlayer(withSource: meowingSoundSource)

    return meowingSoundPlayer
  }
}
