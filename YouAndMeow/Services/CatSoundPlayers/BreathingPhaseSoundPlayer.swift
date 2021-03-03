//
//  BreathingPhaseSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class BreathingPhaseSoundPlayer: CatSoundPlayer {
  var delegate: CatSoundPlayerDelegate?

  private let audioPlayer: AudioPCMBufferPlayer

  init(withSource source: SoundSource, equalizer: AVAudioUnitEQ? = nil) throws {
    let audioPlayer = try AudioPCMBufferPlayer(withInput: source.readIntoPCMBuffer())

    if let equalizer = equalizer { audioPlayer.attach(equalizer) }

    self.audioPlayer = audioPlayer
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
