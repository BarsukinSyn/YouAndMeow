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

  private var soundPlayers: [BreathingPhase: BreathingPhaseSoundPlayer]

  init(breathingPhaseSoundSources: [BreathingPhase: SoundSource]) throws {
    let soundPlayers = try breathingPhaseSoundSources.mapValues { try BreathingPhaseSoundPlayer(withSource: $0) }

    self.soundPlayers = soundPlayers

    self.soundPlayers.values.forEach { $0.delegate = self }
  }

  func attach(equalizers: [BreathingPhase: AVAudioUnitEQ]) {
    self.soundPlayers.forEach { (phase, player) in
      if let equalizer = equalizers[phase] { player.attach(equalizer: equalizer) }
    }
  }

  func prepareToPlay() throws {
    try self.soundPlayers.values.forEach { try $0.prepareToPlay() }
  }

  func play(fragment: SoundFragment) {
    self.soundPlayers[.inhalation]?.play(fragment: fragment)
  }

  func stop() {
    self.soundPlayers.values.forEach { $0.stop() }
  }

  func playerJustFinishedPlaying(_ player: SoundPlayer) {
    let fragment = SoundFragment(start: 0, end: 1)

    if player as AnyObject === self.soundPlayers[.inhalation] {
      self.soundPlayers[.exhalation]?.play(fragment: fragment)
    }

    if player as AnyObject === self.soundPlayers[.exhalation] {
      self.soundPlayers[.inhalation]?.play(fragment: fragment)
    }

    self.delegate?.playerJustFinishedPlaying(player)
  }
}
