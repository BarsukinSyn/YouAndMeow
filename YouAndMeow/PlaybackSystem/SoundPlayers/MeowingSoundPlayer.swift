//
//  MeowingSoundPlayer.swift
//  YouAndMeow
//

import Foundation

final class MeowingSoundPlayer: SoundPlayer {
  weak var delegate: SoundPlayerDelegate?

  private let audioPlayer: AudioByteBufferPlayer

  init(withInput input: Data) throws {
    let audioPlayer = try AudioByteBufferPlayer(withInput: input)

    self.audioPlayer = audioPlayer
  }

  func prepareToPlay() {
    self.audioPlayer.prepareToPlay()
  }

  func play(fragment: SoundFragment, atVolume volume: Float) {
    if self.audioPlayer.isPlaying { return }

    let fragmentDuration = fragment.duration.rounded(to: .hundredth)

    self.audioPlayer.volume = volume
    self.audioPlayer.currentTime = fragment.start
    self.audioPlayer.play()

    Timer.registeredToCommonLoopMode(withTimeInterval: fragmentDuration, repeats: false) { (_) in
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
