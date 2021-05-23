//
//  AudioPCMBufferEngine.swift
//  YouAndMeow
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
