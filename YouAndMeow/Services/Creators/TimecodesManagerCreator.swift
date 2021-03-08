//
//  TimecodesManagerCreator.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

class TimecodesManagerCreator {
  static func createMeowingsTimecodesManager() throws -> TimecodesManager {
    let meowingsTimecodesSource = TimecodesProvider.getMeowingsTimecodes()
    let meowingsTimecodesManager = try TimecodesManager(withSource: meowingsTimecodesSource)

    return meowingsTimecodesManager
  }
}
