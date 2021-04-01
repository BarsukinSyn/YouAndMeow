//
//  PlaybackControlPanelViewModel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.01.2021.
//

import Foundation

class PlaybackControlPanelViewModel: ObservableObject {
  @Published var isPlaying: Bool = false

  private let playbackController: CatSoundPlaybackController?

  init() {
    self.playbackController = try? CatSoundPlaybackController()
  }

  func play() {
    // TODO: handle error
    try? self.playbackController?.play()
    self.isPlaying = true
  }

  func stop() {
    self.playbackController?.stop()
    self.isPlaying = false
  }
}
