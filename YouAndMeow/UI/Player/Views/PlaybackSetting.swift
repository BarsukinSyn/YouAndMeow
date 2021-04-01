//
//  PlaybackSetting.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct PlaybackSetting: View {
  @ObservedObject var viewModel: PlaybackSettingViewModel

  var body: some View {
    SimpleSlider(
      value: self.$viewModel.value,
      bounds: self.viewModel.bounds,
      minimumValueLabel: self.viewModel.minimumValueLabel,
      maximumValueLabel: self.viewModel.maximumValueLabel
    )
  }
}

struct PlaybackSetting_Previews: PreviewProvider {
  static var previews: some View {
    PlaybackSetting(viewModel: PlaybackSettingViewModel(
      type: .breathingRate,
      value: 1,
      bounds: 0...2,
      minimumValueLabel: "Minimum value",
      maximumValueLabel: "Maximum value"
    ))
  }
}
