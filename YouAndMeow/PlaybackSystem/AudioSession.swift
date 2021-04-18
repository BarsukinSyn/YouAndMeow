//
//  AudioSession.swift
//  YouAndMeow
//
//  Created by Vladimir on 07.04.2021.
//

import AVFoundation

protocol AudioSessionDelegate: class {
  func audioSessionNotificationReceived(_ notification: Notification)
}

class AudioSession {
  static let sharedInstance = AudioSession()

  private var delegates: [AudioSessionDelegate?] = []
  private let audioSession = AVAudioSession.sharedInstance()
  private let notificationCenter: NotificationCenter = NotificationCenter.default
  private let observableNotifications: [NSNotification.Name] = [
    AVAudioSession.routeChangeNotification,
    AVAudioSession.interruptionNotification
  ]

  private init() {
    try? self.audioSession.setCategory(.playback, mode: .default, options: [])
    try? self.audioSession.setActive(true)

    self.observableNotifications.forEach {
      self.notificationCenter.addObserver(self, selector: #selector(self.handleNotification), name: $0, object: nil)
    }
  }

  func subscribe(_ delegate: AudioSessionDelegate) {
    self.delegates.append(delegate)
  }

  func unsubscribe(_ delegate: AudioSessionDelegate) {
    self.delegates.removeAll { $0 === delegate || $0 === nil }
  }

  @objc private func handleNotification(_ notification: Notification) {
    self.delegates.forEach { $0?.audioSessionNotificationReceived(notification) }
  }
}
