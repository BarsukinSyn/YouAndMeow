//
//  AudioBufferEngine.swift
//  YouAndMeow
//
//  Created by Vladimir on 20.06.2020.
//

import Foundation

protocol AudioBufferEngine: AnyObject {
  typealias Exception = AudioBufferEngineException

  associatedtype Input
  associatedtype Output

  init(withInput: Input) throws

  var output: Output { get }
  var isActive: Bool { get }

  func start() throws
  func pause()
  func stop()
}

enum AudioBufferEngineException: Error {
  case unexpectedInput
  case deviceError
}
