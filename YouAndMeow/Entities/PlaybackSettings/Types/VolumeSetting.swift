//
//  VolumeSetting.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol VolumeSetting {
  var volume: Float { get }

  func updateVolume(_: Float)
}
