//
//  TooltipPanelViewModel.swift
//  YouAndMeow
//
//  Created by Vladimir on 04.02.2021.
//

import Foundation

final class TooltipPanelViewModel {
  func formatSetting(_ setting: PlaybackSetting, of settingType: PlaybackSettingType) -> String {
    switch settingType {
    case .breathingRate:
      return self.formatBreathingRateSetting(setting)
    case .distance:
      return self.formatDistanceSetting(setting)
    case .meowingRate:
      return self.formatMeowingRateSetting(setting)
    case .symmetry:
      return self.formatSymmetrySetting(setting)
    case .variability:
      return self.formatVariabilitySetting(setting)
    }
  }

  private func formatBreathingRateSetting(_ setting: PlaybackSetting) -> String {
    return String(format: "%.0f purrs per minute", setting.value)
  }

  private func formatDistanceSetting(_ setting: PlaybackSetting) -> String {
    switch setting.valueRatio {
    case 0 ..< 0.1:
      return "Low and Highs"
    case 0.1 ..< 0.2:
      return "More lows, less highs"
    case 0.2 ..< 0.4:
      return "Muffled"
    case 0.4 ..< 0.7:
      return "Balanced"
    case 0.7 ..< 0.9:
      return "Mellow"
    default:
      return "Balanced, but really far away"
    }
  }

  private func formatMeowingRateSetting(_ setting: PlaybackSetting) -> String {
    switch setting.valueRatio {
    case 0:
      return "Pure purring"
    case 0 ..< 0.125:
      return "Rare meows"
    default:
      return String(format: "Around %.0f meows per minute", setting.value)
    }
  }

  private func formatSymmetrySetting(_ setting: PlaybackSetting) -> String {
    switch setting.valueRatio {
    case 0 ..< 0.375:
      return String(format: "Inhale is %.0f%% louder", abs(setting.value * 100))
    case 0.375 ... 0.625:
      return "Even breathing"
    default:
      return String(format: "Exhale is %.0f%% louder", abs(setting.value * 100))
    }
  }

  private func formatVariabilitySetting(_ setting: PlaybackSetting) -> String {
    switch setting.valueRatio {
    case 0 ..< 0.05:
      return "Robocat"
    default:
      return String(format: "%.0f%@", setting.valueRatio * 100, "%")
    }
  }
}

