//
//  BreathingPhaseSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class BreathingPhaseSoundPlayer: SoundPlayer {
  weak var delegate: SoundPlayerDelegate?

  private var playbackTimer: Timer?
  private let audioPlayer: AudioPCMBufferPlayer

  init(withSource source: SoundSource) throws {
    let audioPlayer = try AudioPCMBufferPlayer(withInput: source.readIntoPCMBuffer())

    self.audioPlayer = audioPlayer
  }

  func attach(equalizer: AVAudioUnitEQ) {
    self.audioPlayer.attach(equalizer)
  }

  func prepareToPlay() throws {
    try self.audioPlayer.prepareToPlay()

    self.audioPlayer.engine.output.mainMixerNode.outputVolume = 0
    self.audioPlayer.play()
  }

  func play(fragment: SoundFragment) {
    if !self.audioPlayer.isPlaying { return }

    let fadeDuration = fragment.duration / 3

    self.setVolume(1, fadeDuration: fadeDuration)
    self.playbackTimer = Timer.scheduledTimer(withTimeInterval: fragment.duration, repeats: false) { _ in
      self.setVolume(0, fadeDuration: fadeDuration) { self.delegate?.playerJustFinishedPlaying(self) }
    }
  }

  func stop() {
    self.audioPlayer.stop()
    self.playbackTimer?.invalidate()
  }

  private func setVolume(_ volume: Float, fadeDuration: TimeInterval, completionHandler: (() -> Void)? = nil) {
    var remainingTimeInCentiseconds = max(1, fadeDuration * 100)
    let audioPlayerOutputMainMixerNode = self.audioPlayer.engine.output.mainMixerNode
    let volumeStep = (volume - audioPlayerOutputMainMixerNode.outputVolume) / Float(remainingTimeInCentiseconds)

    Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
      if remainingTimeInCentiseconds < 1 || !self.audioPlayer.isPlaying {
        timer.invalidate()
        audioPlayerOutputMainMixerNode.outputVolume = volume
        completionHandler?()
        return
      }

      remainingTimeInCentiseconds -= 1
      audioPlayerOutputMainMixerNode.outputVolume += volumeStep
    }
  }
}
