//
//  AudioBufferPlayer.swift
//  YouAndMeow
//

import Foundation

protocol AudioBufferPlayer: AnyObject {
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
