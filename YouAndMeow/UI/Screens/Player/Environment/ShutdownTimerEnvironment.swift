//
//  ShutdownTimerEnvironment.swift
//  YouAndMeow
//
//  Created by Vladimir on 18.05.2021.
//

import Foundation

final class ShutdownTimerEnvironment: ObservableObject {
  @Published private (set) var status: ShutdownTimerEnvironment.Status = .inactive
  @Published private (set) var timeLeft: TimeInterval = 0

  private var timer: Timer? = nil
  private weak var playbackSystemEnvironment: PlaybackSystemEnvironment?

  init(playbackSystemEnvironment: PlaybackSystemEnvironment) {
    self.playbackSystemEnvironment = playbackSystemEnvironment
  }

  func prepare() {
    guard self.timer == nil else { return }

    self.status = .preparation
    self.timeLeft = 0
  }

  func activate(interval: TimeInterval) {
    guard let playbackSystemEnvironment = self.playbackSystemEnvironment,
          playbackSystemEnvironment.isPlaying,
          self.timer == nil,
          interval > 0
    else { return }

    self.status = .active
    self.timeLeft = interval
    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: self.tick)
  }

  func cancel() {
    self.timer?.invalidate()
    self.timer = nil
    self.timeLeft = 0
    self.status = .inactive
  }

  private func tick(_ timer: Timer) {
    self.timeLeft -= 1

    if self.timeLeft == 0 {
      self.cancel()
      self.playbackSystemEnvironment?.stop()
    }
  }
}

extension ShutdownTimerEnvironment {
  enum Status {
    case active
    case inactive
    case preparation
  }
}
