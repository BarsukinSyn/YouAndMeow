//
//  AudioBufferPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

protocol AudioBufferPlayer {
  associatedtype Input
  associatedtype Engine

  init(withInput: Input) throws

  var engine: Engine { get }
  var isPlaying: Bool { get }

  func prepareToPlay() throws
  func play()
  func pause()
  func stop()
}
