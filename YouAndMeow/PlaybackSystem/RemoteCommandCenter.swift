//
//  RemoteCommandCenter.swift
//  YouAndMeow
//
//  Created by Vladimir on 09.04.2021.
//

import MediaPlayer

protocol RemoteCommandCenterDelegate: class {
  func playCommandReceived()
  func pauseCommandReceived()
}

final class RemoteCommandCenter {
  static let shared = RemoteCommandCenter()

  weak var delegate: RemoteCommandCenterDelegate?

  private let deviceRemoteCommandCenter: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()

  private init() {
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
}
