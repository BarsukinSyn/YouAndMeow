//
//  PlaybackSettingsEnvironment.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import Foundation

final class PlaybackSettingsEnvironment: ObservableObject {
  @Published private (set) var settingSet: [PlaybackSettingType: PlaybackSettingData] = !!![
    .breathingRate: (value: 60, bounds: 20 ... 100),
    .distance: (value: 0.505, bounds: 0.01 ... 1),
    .meowingRate: (value: 2, bounds: 0 ... 4),
    .symmetry: (value: 0, bounds: -0.4 ... 0.4),
    .variability: (value: 0.1, bounds: 0 ... 0.2)
  ]

  private let playbackController: CatSoundPlaybackController?

  init(playbackController: CatSoundPlaybackController?) {
    self.playbackController = playbackController
  }

  func getData(of settingType: PlaybackSettingType) -> PlaybackSettingData {
    return self.settingSet[settingType]!
  }

  func setValue(_ value: Float, settingType: PlaybackSettingType) {
    let setting = self.settingSet[settingType]!
    let newValue = value.clamped(setting.bounds)

    self.settingSet[settingType]!.value = newValue
    self.updatePlaybackControllerSetting(settingType, value: newValue)
  }

  func reset() {

  }

  private func updatePlaybackControllerSetting(_ settingType: PlaybackSettingType, value: Float) {
    switch settingType {
    case .breathingRate:
      self.playbackController?.setBreathingRate(value)
    case .distance:
      self.playbackController?.setDistance(value)
    case .meowingRate:
      self.playbackController?.setMeowingRate(value)
    case .symmetry:
      self.playbackController?.setSymmetry(value)
    case .variability:
      self.playbackController?.setVariability(value)
    }
  }
}
