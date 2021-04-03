//
//  PlaybackSettingsEnvironment.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import Foundation

final class PlaybackSettingsEnvironment: ObservableObject {
  @Published private (set) var settingSet: [PlaybackSettingType: PlaybackSettingData] = <!>[
    .breathingRate: (
      value: PlaybackSystemSettingsBounds.breathingRate.mean,
      bounds: PlaybackSystemSettingsBounds.breathingRate
    ),
    .distance: (
      value: PlaybackSystemSettingsBounds.distance.mean,
      bounds: PlaybackSystemSettingsBounds.distance
    ),
    .meowingRate: (
      value: PlaybackSystemSettingsBounds.meowingRate.mean,
      bounds: PlaybackSystemSettingsBounds.meowingRate
    ),
    .symmetry: (
      value: PlaybackSystemSettingsBounds.symmetry.mean,
      bounds: PlaybackSystemSettingsBounds.symmetry
    ),
    .variability: (
      value: PlaybackSystemSettingsBounds.variability.mean,
      bounds: PlaybackSystemSettingsBounds.variability
    )
  ]

  private let playbackSystem: PlaybackSystem?

  init(playbackSystem: PlaybackSystem?) {
    self.playbackSystem = playbackSystem
    self.reset()
  }

  func getData(of settingType: PlaybackSettingType) -> PlaybackSettingData {
    return self.settingSet[settingType]!
  }

  func setValue(_ value: Float, settingType: PlaybackSettingType) {
    let data = self.getData(of: settingType)
    let newValue = value.clamped(data.bounds)

    self.settingSet[settingType]!.value = newValue
    self.updatePlaybackControllerSetting(settingType, value: newValue)
  }

  func reset() {
    self.settingSet = self.settingSet.mapValues { (value: $0.bounds.mean, bounds: $0.bounds) }

    self.settingSet.forEach { (type, data) in
      self.updatePlaybackControllerSetting(type, value: data.value)
    }
  }

  private func updatePlaybackControllerSetting(_ settingType: PlaybackSettingType, value: Float) {
    switch settingType {
    case .breathingRate:
      self.playbackSystem?.setBreathingRate(value)
    case .distance:
      self.playbackSystem?.setDistance(value)
    case .meowingRate:
      self.playbackSystem?.setMeowingRate(value)
    case .symmetry:
      self.playbackSystem?.setSymmetry(value)
    case .variability:
      self.playbackSystem?.setVariability(value)
    }
  }
}
