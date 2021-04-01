//
//  PlaybackControlViewData.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.01.2021.
//

import SwiftUI

struct PlaybackControlViewData {
  var type: PlaybackControlType
  var value: Binding<Float>
  var bounds: ClosedRange<Float>
  var minimumValueLabel: String
  var maximumValueLabel: String
}
