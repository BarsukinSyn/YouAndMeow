//
//  PlaybackControllerCreator.swift
//  YouAndMeow
//

import Foundation

final class PlaybackControllerCreator {
  private init() {}

  static func createBreathingPlaybackController() throws -> BreathingPlaybackController {
    let inhalationSoundPlayer = try SoundPlayerCreator.createInhalationSoundPlayer()
    let exhalationSoundPlayer = try SoundPlayerCreator.createExhalationSoundPlayer()
    let soundPlayers = BreathingPhases(inhalation: inhalationSoundPlayer, exhalation: exhalationSoundPlayer)
    let breathingFragmentManager = FragmentManagerCreator.createBreathingFragmentManager()
    let breathingPlaybackController = BreathingPlaybackController(
      withPlayers: soundPlayers,
      andFragmentManager: breathingFragmentManager
    )

    return breathingPlaybackController
  }

  static func createMeowingPlaybackController() throws -> MeowingPlaybackController {
    let meowingSoundPlayer = try SoundPlayerCreator.createMeowingSoundPlayer()
    let meowingFragmentManager = try FragmentManagerCreator.createMeowingFragmentManager()
    let meowingPlaybackController = MeowingPlaybackController(
      withPlayer: meowingSoundPlayer,
      andFragmentManager: meowingFragmentManager
    )

    return meowingPlaybackController
  }
}
