//
//  PlaybackSettingViewModel.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.01.2021.
//

import SwiftUI

class PlaybackSettingViewModel: ObservableObject {
  @Published var value: Float

  let type: PlaybackSettingType
  let bounds: ClosedRange<Float>
  let minimumValueLabel: String
  let maximumValueLabel: String

  init(
    type: PlaybackSettingType,
    value: Float,
    bounds: ClosedRange<Float>,
    minimumValueLabel: String,
    maximumValueLabel: String
  ) {
    self.type = type
    self.value = value
    self.bounds = bounds
    self.minimumValueLabel = minimumValueLabel
    self.maximumValueLabel = maximumValueLabel
  }
}
