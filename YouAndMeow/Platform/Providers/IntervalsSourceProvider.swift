//
//  IntervalsSourceProvider.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class IntervalsSourceProvider {
  private init() {}

  static func getMeowingIntervals() -> Source {
    let meowingIntervalsFile = File(name: "MeowingIntervals", type: "plist")
    let meowingIntervalsSource = Source(file: meowingIntervalsFile)

    return meowingIntervalsSource
  }
}
