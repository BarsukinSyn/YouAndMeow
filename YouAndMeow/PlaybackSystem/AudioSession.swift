//
//  AudioSession.swift
//  YouAndMeow
//
//  Created by Vladimir on 07.04.2021.
//

import AVFoundation

protocol AudioSessionDelegate: AnyObject {
  func audioSessionNotificationReceived(_ notification: Notification)
}

final class AudioSession {
  static let shared = AudioSession()

  weak var delegate: AudioSessionDelegate?
  private (set) var isActive: Bool = false

  private let deviceAudioSession: AVAudioSession = AVAudioSession.sharedInstance()
  private let notificationCenter: NotificationCenter = NotificationCenter.default
  private let observableNotifications: [NSNotification.Name] = [
    AVAudioSession.routeChangeNotification,
    AVAudioSession.interruptionNotification
  ]

  private init() {
    self.observableNotifications.forEach {
      self.notificationCenter.addObserver(self, selector: #selector(self.handleNotification), name: $0, object: nil)
    }
  }

  func setCategory(_ category: AVAudioSession.Category) throws {
    do {
      try self.deviceAudioSession.setCategory(category)
    } catch {
      throw AudioSession.Exception.deviceError
    }
  }

  func setActive(_ active: Bool) throws {
    do {
      try self.deviceAudioSession.setActive(active)
      self.isActive = active
    } catch {
      self.isActive = false
      throw AudioSession.Exception.deviceError
    }
  }

  @objc private func handleNotification(_ notification: Notification) {
    guard self.isActive else { return }

    self.delegate?.audioSessionNotificationReceived(notification)
  }
}

extension AudioSession {
  enum Exception: Error {
    case deviceError
  }
}
