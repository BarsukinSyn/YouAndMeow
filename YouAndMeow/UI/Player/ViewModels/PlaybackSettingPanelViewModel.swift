//
//  PlaybackSettingPanelViewModel.swift
//  YouAndMeow
//
//  Created by Vladimir on 28.01.2021.
//

import Foundation

final class PlaybackSettingPanelViewModel {
  let settingTypeOrder: [PlaybackSettingType] = [
    .breathingRate,
    .variability,
    .symmetry,
    .distance,
    .meowingRate
  ]

  private let settingMetadataSet: [PlaybackSettingType: PlaybackSettingMetadata] = !!![
    .breathingRate: (minimumValueLabel: "Sleepy", maximumValueLabel: "Happy"),
    .distance: (minimumValueLabel: "Close", maximumValueLabel: "Distant"),
    .meowingRate: (minimumValueLabel: "Purrfect", maximumValueLabel: "Meow-y"),
    .symmetry: (minimumValueLabel: "Purr In", maximumValueLabel: "Purr Out"),
    .variability: (minimumValueLabel: "Steady", maximumValueLabel: "Lively")
  ]

  func getMetadata(of settingType: PlaybackSettingType) -> PlaybackSettingMetadata {
    return self.settingMetadataSet[settingType]!
  }
}
