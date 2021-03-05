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

  func play(fragment: SoundFragment) {}

  func stop() {
    self.audioPlayer.stop()
  }

  private func fadeVolumeIn() {}

  private func fadeVolumeOut() {
    self.delegate?.playerJustFinishedPlaying(self)
  }
}
