//
//  AudioBufferPlayer.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.06.2020.
//

import Foundation

protocol AudioBufferPlayer: class {
  associatedtype Input
  associatedtype Engine

  init(withInput: Input) throws

  var engine: Engine { get }
  var isPlaying: Bool { get }
  var volume: Float { get set }

  func prepareToPlay() throws
  func play()
  func pause()
  func stop()
}
