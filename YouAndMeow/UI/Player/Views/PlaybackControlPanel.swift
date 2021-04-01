//
//  PlaybackControlPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.01.2021.
//

import SwiftUI

struct PlaybackControlPanel: View {
  let controls: [PlaybackControlViewModel]

  private let verticalSpacing: CGFloat = 24

  var body: some View {
    VStack(spacing: self.verticalSpacing) {
      ForEach(self.controls, id: \.type) { controlData in
        SimpleSlider(
          value: controlData.value,
          bounds: controlData.bounds,
          minimumValueLabel: controlData.minimumValueLabel,
          maximumValueLabel: controlData.maximumValueLabel
        )
      }
    }
  }
}

struct PlaybackControlPanel_Previews: PreviewProvider {
  static var previews: some View {
    PlaybackControlPanel(controls: PlaybackControlType.allCases.map { (type) in
      PlaybackControlViewModel(
        type: type,
        value: .constant(1),
        bounds: 0...2,
        minimumValueLabel: "Minimum value",
        maximumValueLabel: "Maximum value"
      )
    })
  }
}
