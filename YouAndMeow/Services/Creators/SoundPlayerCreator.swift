//
//  SoundPlayerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol SoundPlayerCreator {
  associatedtype Player = SoundPlayer

  static func create() throws -> Player
}
