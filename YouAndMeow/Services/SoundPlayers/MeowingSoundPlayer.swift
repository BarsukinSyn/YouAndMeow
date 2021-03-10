//
//  MeowingSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

final class MeowingSoundPlayer: SoundPlayer {
  weak var delegate: SoundPlayerDelegate?

  private let audioPlayer: AudioByteBufferPlayer

  private var audioPlayerVolume: Float {
    get { self.audioPlayer.volume }
    set { self.audioPlayer.volume = newValue }
  }

  private var audioPlayerCurrentTime: TimeInterval {
    get { self.audioPlayer.currentTime }
    set { self.audioPlayer.currentTime = newValue }
  }

  init(withSource source: SoundSource) throws {
    let audioBuffer = try source.readIntoByteBuffer()
    let audioPlayer = try AudioByteBufferPlayer(withInput: audioBuffer)

    self.audioPlayer = audioPlayer
  }

  func prepareToPlay() {
    self.audioPlayer.prepareToPlay()
  }

  func play(fragment: SoundFragment, atVolume volume: Float) {
    if self.audioPlayer.isPlaying { return }

    self.audioPlayerVolume = volume
    self.audioPlayerCurrentTime = fragment.start
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
