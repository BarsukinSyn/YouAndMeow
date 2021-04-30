//
//  RemoteCommandCenter.swift
//  YouAndMeow
//
//  Created by Vladimir on 09.04.2021.
//

import MediaPlayer

protocol RemoteCommandCenterDelegate: AnyObject {
  func playCommandReceived()
  func pauseCommandReceived()
}

final class RemoteCommandCenter {
  static let shared = RemoteCommandCenter()

  weak var delegate: RemoteCommandCenterDelegate?

  private let infoCenterTitle: String = "You & Meow"
  private let deviceRemoteCommandCenter: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()
  private let deviceNowPlayingInfoCenter: MPNowPlayingInfoCenter = MPNowPlayingInfoCenter.default()

  private init() {
    self.registerCommands()
    self.setNowPlayingInfo()
  }

  private func registerCommands() {
    self.deviceRemoteCommandCenter.playCommand.isEnabled = true
    self.deviceRemoteCommandCenter.playCommand.addTarget { (_) -> MPRemoteCommandHandlerStatus in
      self.delegate?.playCommandReceived()

      return .success
    }

    self.deviceRemoteCommandCenter.pauseCommand.isEnabled = true
    self.deviceRemoteCommandCenter.pauseCommand.addTarget { (_) -> MPRemoteCommandHandlerStatus in
      self.delegate?.pauseCommandReceived()

      return .success
    }
  }

  private func setNowPlayingInfo() {
    let mediaItemArtwork = MPMediaItemArtwork(boundsSize: .zero) { (size) -> UIImage in
      ImageRepository.getInfoCenterArtwork()
    }

    self.deviceNowPlayingInfoCenter.nowPlayingInfo = [
      MPMediaItemPropertyTitle: self.infoCenterTitle,
      MPMediaItemPropertyArtwork: mediaItemArtwork
    ]
  }
}
