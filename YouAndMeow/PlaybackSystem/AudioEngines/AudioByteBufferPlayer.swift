//
//  AudioByteBufferPlayer.swift
//  YouAndMeow
//

import Foundation

final class AudioByteBufferPlayer: AudioBufferPlayer {
  typealias Input = Engine.Input
  typealias Engine = AudioByteBufferEngine

  let engine: Engine

  var isPlaying: Bool {
    self.engine.isActive
  }

  var volume: Float {
    get { self.engine.output.volume }
    set { self.engine.output.volume = newValue.rounded(to: .hundredth) }
  }

  var currentTime: TimeInterval {
    get { self.engine.output.currentTime }
    set { self.engine.output.currentTime = newValue.rounded(to: .hundredth) }
  }

  init(withInput input: Input) throws {
    let engine = try Engine(withInput: input)

    self.engine = engine
  }

  func prepareToPlay() {
    if self.isPlaying { return }

    self.engine.start()
  }

  func play() {
    if self.isPlaying { return }

    self.engine.output.play()
  }

  func pause() {
    self.engine.pause()
  }

  func stop() {
    self.engine.stop()
  }
}
