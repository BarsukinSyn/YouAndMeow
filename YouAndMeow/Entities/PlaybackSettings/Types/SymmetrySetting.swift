//
//  SymmetrySetting.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol SymmetrySetting {
  var symmetry: Float { get }

  func updateSymmetry(_: Float)
}
