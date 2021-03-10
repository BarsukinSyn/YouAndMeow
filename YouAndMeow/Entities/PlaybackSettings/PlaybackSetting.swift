//
//  PlaybackSetting.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

@propertyWrapper
struct PlaybackSetting {
  let minimumValue: Float
  let maximumValue: Float

  var averageValue: Float {
    (self.minimumValue + self.maximumValue) / 2
  }

  var projectedValue: Float {
    self.currentValue
  }

  var wrappedValue: Float {
    get { self.currentValue }
    set { self.currentValue = (self.minimumValue...self.maximumValue).clamped(newValue) }
  }

  private var currentValue: Float = 0

  init(wrappedValue: Float, minimumValue: Float, maximumValue: Float) {
    self.minimumValue = minimumValue
    self.maximumValue = maximumValue
    self.wrappedValue = wrappedValue
  }
}
