//
//  PlaybackSystemSettingsBounds.swift
//  YouAndMeow
//
//  Created by Vladimir on 02.02.2021.
//

import Foundation

struct PlaybackSystemSettingsBounds {
  private init() {}

  static var breathingRate: ClosedRange<Float> = 20 ... 100
  static var distance: ClosedRange<Float> = 0.01 ... 1
  static var meowingRate: ClosedRange<Float> = 0 ... 4
  static var symmetry: ClosedRange<Float> = -0.4 ... 0.4
  static var variability: ClosedRange<Float> = 0 ... 0.2
  static var volume: ClosedRange<Float> = 0 ... 1
}
