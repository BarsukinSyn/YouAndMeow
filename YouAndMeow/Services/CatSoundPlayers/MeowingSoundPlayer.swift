//
//  MeowingSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class MeowingSoundPlayer: CatSoundPlayer {
  var delegate: CatSoundPlayerDelegate?

  private let audioPlayer: AudioByteBufferPlayer

  init(withSource source: Source) throws {
    let audioPlayer = try AudioByteBufferPlayer(withInput: source.readIntoByteBuffer())

    self.audioPlayer = audioPlayer
  }

  func prepareToPlay() {
    self.audioPlayer.prepareToPlay()
  }

  func play(fragment: SoundFragment) {
    self.audioPlayer.engine.output.currentTime = fragment.start
    self.audioPlayer.play()

    Timer.scheduledTimer(withTimeInterval: fragment.duration, repeats: false) { _ in
      self.pause()
      self.delegate?.playerJustFinishedPlaying(self)
    }
  }

  func pause() {
    self.audioPlayer.pause()
  }

  func stop() {
    self.audioPlayer.stop()
  }
}
