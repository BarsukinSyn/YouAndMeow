//
//  PlaybackSystemEnvironment.swift
//  YouAndMeow
//
//  Created by Vladimir on 30.01.2021.
//

import Foundation

final class PlaybackSystemEnvironment: ObservableObject, AudioSessionDelegate {
  @Published private (set) var isPlaying: Bool = false
  @Published private (set) var error: PlaybackSystemEnvironment.Exception?

  private (set) var playbackSystem: PlaybackSystem?

  init() {
    self.prepareToPlay()
    AudioSession.sharedInstance.subscribe(self)
  }

  deinit {
    AudioSession.sharedInstance.unsubscribe(self)
  }

  func prepareToPlay() {
    if self.playbackSystem != nil { return }

    do {
      self.error = nil
      self.playbackSystem = try PlaybackSystem()
    } catch {
      self.error = .serviceUnavailable
    }
  }

  func play() {
    do {
      guard let playbackSystem = self.playbackSystem else { throw Exception.serviceUnavailable }

      try playbackSystem.play()
      self.isPlaying = true
    } catch {
      self.isPlaying = false
      self.error = error is PlaybackSystemEnvironment.Exception ? .serviceUnavailable : .playbackCannotStart
    }
  }

  func stop() {
    self.playbackSystem?.stop()
    self.isPlaying = false
  }

  func audioSessionNotificationReceived(_ notification: Notification) {
    self.stop()
  }
}

extension PlaybackSystemEnvironment {
  enum Exception: Error {
    case serviceUnavailable
    case playbackCannotStart
  }
}
