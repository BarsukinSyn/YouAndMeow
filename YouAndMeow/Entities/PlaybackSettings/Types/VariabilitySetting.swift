//
//  VariabilitySetting.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol VariabilitySetting {
  var variability: Float { get }

  func updateVariability(_: Float)
}
