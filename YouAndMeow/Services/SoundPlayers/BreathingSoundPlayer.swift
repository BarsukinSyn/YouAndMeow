//
//  BreathingSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class BreathingSoundPlayer: SoundPlayer, SoundPlayerDelegate {
  weak var delegate: SoundPlayerDelegate?

  private let inhalationSoundPlayer: BreathingPhaseSoundPlayer
  private let exhalationSoundPlayer: BreathingPhaseSoundPlayer
  private var breathingSoundPlayers: [BreathingPhaseSoundPlayer] {
    [self.inhalationSoundPlayer, self.exhalationSoundPlayer]
  }

  init(breathingPhaseSoundSources: [BreathingPhase: SoundSource]) throws {
    guard let inhalationSoundSource = breathingPhaseSoundSources[.inhalation],
      let exhalationSoundSource = breathingPhaseSoundSources[.exhalation]
      else { throw BreathingSoundPlayer.Exception.incompleteData }

    let inhalationSoundPlayer = try BreathingPhaseSoundPlayer(withSource: inhalationSoundSource)
    let exhalationSoundPlayer = try BreathingPhaseSoundPlayer(withSource: exhalationSoundSource)

    self.inhalationSoundPlayer = inhalationSoundPlayer
    self.exhalationSoundPlayer = exhalationSoundPlayer

    self.inhalationSoundPlayer.delegate = self
    self.exhalationSoundPlayer.delegate = self
  }

  func attach(equalizer: AVAudioUnitEQ) {
    self.breathingSoundPlayers.forEach { $0.attach(equalizer: equalizer) }
  }

  func prepareToPlay() throws {
    try self.breathingSoundPlayers.forEach { try $0.prepareToPlay() }
  }

  func play(fragment: SoundFragment) {}

  func stop() {
    self.breathingSoundPlayers.forEach { $0.stop() }
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {
    self.delegate?.playerJustFinishedPlaying(player)
  }
}

extension BreathingSoundPlayer {
  enum BreathingPhase {
    case inhalation
    case exhalation
  }
  
  enum Exception: Error {
    case incompleteData
  }
}
