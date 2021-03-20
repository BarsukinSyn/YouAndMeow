//
//  ContentView.swift
//  YouAndMeow
//
//  Created by Vladimir on 19.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var player: CatSoundPlaybackController?

  init() {
    self.player = try? CatSoundPlaybackController()
  }

  var body: some View {
    Button {
      try? self.player?.play()
    } label: { 
      Text("Play")
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
