//
//  AudioPCMBufferEngine.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.06.2020.
//

import AVFoundation

final class AudioPCMBufferEngine: AudioBufferEngine {
  typealias Input = AVAudioPCMBuffer
  typealias Output = AVAudioEngine

  let output: Output

  var isActive: Bool {
    self.output.isRunning
  }

  init(withInput input: Input) {
    let output = Output()

    self.output = output
  }

  func start() throws {
    if self.output.isRunning { return }

    do {
      try self.output.start()
    } catch {
      throw AudioBufferEngine.Exception.deviceError
    }
  }

  func pause() {
    self.output.pause()
  }

  func stop() {
    self.output.stop()
  }
}
