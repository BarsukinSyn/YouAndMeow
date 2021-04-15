//
//  PlaybackSettingsEnvironment.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import Foundation

final class PlaybackSettingsEnvironment: ObservableObject {
  @Published private (set) var settingSet: [PlaybackSettingType: PlaybackSetting] = <!>[
    .breathingRate: PlaybackSetting(SettingsBounds.breathingRate.mean, bounds: SettingsBounds.breathingRate),
    .distance: PlaybackSetting(SettingsBounds.distance.mean, bounds: SettingsBounds.distance),
    .meowingRate: PlaybackSetting(SettingsBounds.meowingRate.mean, bounds: SettingsBounds.meowingRate),
    .symmetry: PlaybackSetting(SettingsBounds.symmetry.mean, bounds: SettingsBounds.symmetry),
    .variability: PlaybackSetting(SettingsBounds.variability.mean, bounds: SettingsBounds.variability)
  ]

  private let playbackSystem: PlaybackSystem?

  init(playbackSystem: PlaybackSystem?) {
    self.playbackSystem = playbackSystem
    self.syncPlaybackSystemSettings()
  }

  func get(_ settingType: PlaybackSettingType) -> PlaybackSetting {
    return self.settingSet[settingType]!
  }

  func set(_ value: Float, settingType: PlaybackSettingType) {
    let setting = self.get(settingType)
    let newValue = value.clamped(setting.bounds)

    self.settingSet[settingType]!.value = newValue
    self.updatePlaybackSystemSetting(settingType, value: newValue)
  }

  func reset() {
    let defaultSet = self.settingSet.mapValues { PlaybackSetting($0.bounds.mean, bounds: $0.bounds) }

    self.settingSet = defaultSet
    self.syncPlaybackSystemSettings()
  }

  private func syncPlaybackSystemSettings() {
    self.settingSet.forEach { (type, setting) in
      self.updatePlaybackSystemSetting(type, value: setting.value)
    }
  }

  private func updatePlaybackSystemSetting(_ settingType: PlaybackSettingType, value: Float) {
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

extension PlaybackSettingsEnvironment {
  typealias SettingsBounds = PlaybackSystemSettingsBounds
}
