//
//  TimecodesProvider.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class TimecodesProvider {
  static func getMeowingsTimecodes() -> Source {
    let meowingsTimecodesFile = File(name: "MeowingsTimecodes", type: "plist")
    let meowingsTimecodesSource = Source(file: meowingsTimecodesFile)

    return meowingsTimecodesSource
  }
}
