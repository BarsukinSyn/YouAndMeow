//
//  BreathingSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class BreathingSoundPlayer: SoundPlayer {
  weak var delegate: SoundPlayerDelegate?

  private var isPlaying: Bool = false
  private var playbackTimer: Timer?
  private let audioPlayer: AudioPCMBufferPlayer

  init(withInput input: AVAudioPCMBuffer) {
    let audioPlayer = AudioPCMBufferPlayer(withInput: input)

    self.audioPlayer = audioPlayer
  }

  func attach(equalizer: AVAudioUnitEQ) {
    self.audioPlayer.attach(equalizer)
  }

  func prepareToPlay() throws {
    if self.audioPlayer.isPlaying { return }

    try self.audioPlayer.prepareToPlay()
    self.audioPlayer.volume = 0
    self.audioPlayer.play()
  }

  func play(fragment: SoundFragment, atVolume volume: Float) {
    if !self.audioPlayer.isPlaying || self.isPlaying { return }

    let fadeDuration = fragment.duration / 3

    self.isPlaying = true
    self.setVolume(volume, fadeDuration: fadeDuration)
    self.playbackTimer = Timer.scheduledTimer(withTimeInterval: fragment.duration, repeats: false) { (_) in
      self.setVolume(0, fadeDuration: fadeDuration) {
        self.isPlaying = false
        self.delegate?.playerJustFinishedPlaying(self)
      }
    }
  }

  func stop() {
    self.audioPlayer.stop()
    self.playbackTimer?.invalidate()
    self.isPlaying = false
  }

  private func setVolume(_ volume: Float, fadeDuration: TimeInterval, completionHandler: VoidFunction? = nil) {
    var remainingTimeInCentiseconds = max(1, fadeDuration * 100)
    let volumeStep = (volume - self.audioPlayer.volume) / Float(remainingTimeInCentiseconds)

    Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
      if remainingTimeInCentiseconds < 1 || !self.audioPlayer.isPlaying {
        self.audioPlayer.volume = volume

        timer.invalidate()
        completionHandler?()

        return
      }

      remainingTimeInCentiseconds -= 1
      self.audioPlayer.volume += volumeStep
    }
  }
}
