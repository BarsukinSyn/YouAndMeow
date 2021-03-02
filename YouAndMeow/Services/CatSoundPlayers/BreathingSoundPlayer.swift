//
//  BreathingSoundPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 22.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import AVFoundation

final class BreathingSoundPlayer: CatSoundPlayer {
  typealias Exception = BreathingSoundPlayerException

  enum BreathingPhase {
    case inhalation
    case exhalation
  }

  var delegate: CatSoundPlayerDelegate?

  private let inhalationSoundPlayer: BreathingPhaseSoundPlayer
  private let exhalationSoundPlayer: BreathingPhaseSoundPlayer
  private var players: [BreathingPhaseSoundPlayer] { [inhalationSoundPlayer, exhalationSoundPlayer] }

  init(breathingPhaseSoundSources: [BreathingPhase: Source], equalizer: AVAudioUnitEQ? = nil) throws {
    guard let inhalationSoundSource = breathingPhaseSoundSources[.inhalation],
      let exhalationSoundSource = breathingPhaseSoundSources[.exhalation]
      else { throw BreathingSoundPlayer.Exception.incompleteData }

    let inhalationSoundPlayer = try BreathingPhaseSoundPlayer(withSource: inhalationSoundSource, equalizer: equalizer)
    let exhalationSoundPlayer = try BreathingPhaseSoundPlayer(withSource: exhalationSoundSource, equalizer: equalizer)

    self.inhalationSoundPlayer = inhalationSoundPlayer
    self.exhalationSoundPlayer = exhalationSoundPlayer
  }

  func prepareToPlay() throws {
    try self.players.forEach { try $0.prepareToPlay() }
  }

  func play(fragment: SoundFragment) {}

  func stop() {
    self.players.forEach { $0.stop() }
  }
}

enum BreathingSoundPlayerException: Error {
  case incompleteData
}
