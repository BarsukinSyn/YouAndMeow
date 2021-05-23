//
//  PlaybackSystemEnvironment.swift
//  YouAndMeow
//

import Foundation

final class PlaybackSystemEnvironment: ObservableObject, AudioSessionDelegate, RemoteCommandCenterDelegate {
  @Published private (set) var isPlaying: Bool = false
  @Published private (set) var error: PlaybackSystemEnvironment.Exception?

  private (set) var playbackSystem: PlaybackSystem?

  init() {
    self.prepareToPlay()
    AudioSession.shared.delegate = self
    RemoteCommandCenter.shared.delegate = self
  }

  func prepareToPlay() {
    if self.playbackSystem != nil { return }

    do {
      self.error = nil
      self.playbackSystem = try PlaybackSystem()
      try AudioSession.shared.setCategory(.playback)
    } catch {
      self.error = .serviceUnavailable
    }
  }

  func play() {
    do {
      guard let playbackSystem = self.playbackSystem else {
        throw PlaybackSystemEnvironment.Exception.playbackCannotStart
      }

      try AudioSession.shared.setActive(true)
      try playbackSystem.play()
      self.isPlaying = true
    } catch {
      self.isPlaying = false
      self.error = .playbackCannotStart
    }
  }

  func stop() {
    self.playbackSystem?.stop()
    try? AudioSession.shared.setActive(false)
    self.isPlaying = false
  }

  func playCommandReceived() {
    self.play()
  }

  func pauseCommandReceived() {
    self.stop()
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
