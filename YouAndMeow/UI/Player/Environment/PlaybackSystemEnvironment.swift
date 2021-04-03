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

  private (set) var playbackSystem: PlaybackSystem?

  init() {
    do {
      self.playbackSystem = try PlaybackSystem()
    } catch {
      self.error = .playbackCannotStart
    }
  }

  func play() {
    do {
      try self.playbackSystem?.play()
      self.isPlaying = true
    } catch {
      self.isPlaying = false
      self.error = .playbackCannotStart
    }
  }

  func stop() {
    self.playbackSystem?.stop()
    self.isPlaying = false
  }
}

extension PlaybackSystemEnvironment {
  enum Error {
    case playbackCannotStart
  }
}
