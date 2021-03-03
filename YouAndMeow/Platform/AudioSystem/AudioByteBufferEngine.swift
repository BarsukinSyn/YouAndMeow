//
//  AudioByteBufferEngine.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class AudioByteBufferEngine: AudioBufferEngine {
  typealias Input = Data
  typealias Output = AVAudioPlayer

  let output: Output
  var isActive: Bool { self.output.isPlaying }

  init(withInput input: Input) throws {
    do {
      let output = try Output(data: input)

      self.output = output
    } catch {
      throw AudioBufferEngine.Exception.unexpectedInput
    }
  }

  func start() {
    self.output.prepareToPlay()
  }

  func pause() {
    self.output.pause()
  }

  func stop() {
    self.output.stop()
  }
}
