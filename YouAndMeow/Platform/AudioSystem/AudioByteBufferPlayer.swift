//
//  AudioByteBufferPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class AudioByteBufferPlayer: AudioBufferPlayer {
  typealias Input = Engine.Input
  typealias Engine = AudioByteBufferEngine

  let engine: Engine

  init(withInput input: Input) throws {
    let engine = try Engine(withInput: input)

    self.engine = engine
  }

  func prepareToPlay() {
    if self.engine.isActive { return }

    self.engine.start()
  }

  func play() {
    if self.engine.isActive { return }

    self.engine.output.play()
  }

  func pause() {
    self.engine.pause()
  }

  func stop() {
    self.engine.stop()
  }
}
