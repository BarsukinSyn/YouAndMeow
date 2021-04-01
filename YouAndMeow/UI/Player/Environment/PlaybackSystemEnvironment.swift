//
//  PlaybackSystemEnvironment.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import Foundation

final class PlaybackSystemEnvironment: ObservableObject {
  @Published var error: PlaybackSystemEnvironment.Error?
  @Published var isPlaying: Bool = false

  private (set) var playbackController: CatSoundPlaybackController?

  init() {
    do {
      self.playbackController = try CatSoundPlaybackController()
    } catch {
      self.error = .playbackCannotStart
    }
  }

  func play() {
    do {
      try self.playbackController?.play()
      self.isPlaying = true
    } catch {
      self.isPlaying = false
      self.error = .playbackCannotStart
    }
  }

  func stop() {
    self.playbackController?.stop()
    self.isPlaying = false
  }
}

extension PlaybackSystemEnvironment {
  enum Error {
    case playbackCannotStart
  }
}
