//
//  RateSetting.swift
//  YouAndMeow
//
//  Created by Vladimir on 01.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol RateSetting {
  var rate: Float { get }

  func updateRate(_: Float)
}
