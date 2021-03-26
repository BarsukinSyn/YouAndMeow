//
//  AVAudioEngine.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.06.2020.
//

import AVFoundation

extension AVAudioEngine {
  func attach(_ nodes: [AVAudioNode]) {
    nodes.forEach { self.attach($0) }
  }

  func attach(_ nodes: AVAudioNode...) {
    self.attach(nodes)
  }

  func connect(_ nodes: [AVAudioNode], format: AVAudioFormat?) {
    for x in 0 ..< nodes.count - 1 {
      self.connect(nodes[x], to: nodes[x + 1], format: format)
    }
  }

  func connect(_ nodes: AVAudioNode..., format: AVAudioFormat?) {
    self.connect(nodes, format: format)
  }

  func disconnect(_ nodes: [AVAudioNode]) {
    nodes.forEach {
      self.disconnectNodeInput($0)
      self.disconnectNodeOutput($0)
    }
  }

  func disconnect(_ nodes: AVAudioNode...) {
    self.disconnect(nodes)
  }
}
