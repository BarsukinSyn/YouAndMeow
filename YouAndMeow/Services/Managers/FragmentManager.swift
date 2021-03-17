//
//  FragmentManager.swift
//  YouAndMeow
//
//  Created by Vladimir on 08.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol FragmentManager: class {
  init(withIntervals: [TimeInterval])

  func getFragment() -> SoundFragment
}
