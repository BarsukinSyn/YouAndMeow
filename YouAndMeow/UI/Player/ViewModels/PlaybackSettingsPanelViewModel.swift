//
//  PlaybackSettingsPanelViewModel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import Foundation

class PlaybackSettingsPanelViewModel: ObservableObject {
  @Published var settings: [PlaybackSettingViewModel]

  private let breathingRateSetting: PlaybackSettingViewModel = PlaybackSettingViewModel(
    type: .breathingRate,
    value: 60,
    bounds: 20...100,
    minimumValueLabel: "Sleepy",
    maximumValueLabel: "Happy"
  )

  private let distanceSetting: PlaybackSettingViewModel = PlaybackSettingViewModel(
    type: .distance,
    value: 60,
    bounds: 20...100,
    minimumValueLabel: "Close",
    maximumValueLabel: "Distant"
  )

  private let meowingRateSetting: PlaybackSettingViewModel = PlaybackSettingViewModel(
    type: .meowingRate,
    value: 60,
    bounds: 20...100,
    minimumValueLabel: "Purrfect",
    maximumValueLabel: "Meow-y"
  )

  private let symmetrySetting: PlaybackSettingViewModel = PlaybackSettingViewModel(
    type: .symmetry,
    value: 60,
    bounds: 20...100,
    minimumValueLabel: "Purr In",
    maximumValueLabel: "Purr Out"
  )

  private let variabilitySetting: PlaybackSettingViewModel = PlaybackSettingViewModel(
    type: .variability,
    value: 60,
    bounds: 20...100,
    minimumValueLabel: "Steady",
    maximumValueLabel: "Lively"
  )

  init() {
    self.settings = [
      self.breathingRateSetting,
      self.variabilitySetting,
      self.symmetrySetting,
      self.distanceSetting,
      self.meowingRateSetting
    ]
  }
}
