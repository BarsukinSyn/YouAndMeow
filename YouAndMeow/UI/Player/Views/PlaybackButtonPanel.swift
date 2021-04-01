//
//  PlaybackButtonPanel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import SwiftUI

struct PlaybackButtonPanel: View {
  @Binding var isActive: Bool
  
  var playButtonAction: VoidFunction
  var stopButtonAction: VoidFunction
  var resetButtonAction: VoidFunction

  var body: some View {
    HStack {
      Spacer()

      TextButton(label: "Reset", action: self.resetButtonAction).disabled(self.isActive)

      self.isActive
        ? TextButton(label: "Stop", action: self.stopButtonAction)
        : TextButton(label: "Play", action: self.playButtonAction)
    }
  }
}

struct PlaybackButtonPanel_Previews: PreviewProvider {
  static var previews: some View {
    PlaybackButtonPanel(
      isActive: .constant(true),
      playButtonAction: {},
      stopButtonAction: {},
      resetButtonAction: {}
    )
  }
}
