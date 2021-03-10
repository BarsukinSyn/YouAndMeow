//
//  PlaybackController.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol PlaybackController: SoundPlayerDelegate {
  func play() throws
  func stop()
}
