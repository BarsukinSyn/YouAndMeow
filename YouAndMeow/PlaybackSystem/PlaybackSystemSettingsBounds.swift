//
//  PlaybackSystemSettingsBounds.swift
//  YouAndMeow
//

import Foundation

struct PlaybackSystemSettingsBounds {
  private init() {}

  static let breathingRate: ClosedRange<Float> = 20 ... 100
  static let distance: ClosedRange<Float> = 0.01 ... 1
  static let meowingRate: ClosedRange<Float> = 0 ... 4
  static let symmetry: ClosedRange<Float> = -0.4 ... 0.4
  static let variability: ClosedRange<Float> = 0 ... 0.2
  static let volume: ClosedRange<Float> = 0 ... 1
}
