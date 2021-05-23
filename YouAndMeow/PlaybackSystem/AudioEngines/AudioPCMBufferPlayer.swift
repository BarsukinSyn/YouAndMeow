//
//  AudioPCMBufferPlayer.swift
//  YouAndMeow
//

import AVFoundation

final class AudioPCMBufferPlayer: AudioBufferPlayer {
  typealias Input = Engine.Input
  typealias Engine = AudioPCMBufferEngine

  let engine: Engine

  var isPlaying: Bool {
    self.engine.isActive && self.playerNode.isPlaying
  }

  var volume: Float {
    get { self.engine.output.mainMixerNode.outputVolume }
    set { self.engine.output.mainMixerNode.outputVolume = newValue.rounded(to: .hundredth) }
  }

  private let input: Input
  private let playerNode: AVAudioPlayerNode
  private var attachedNodes: [AVAudioNode]

  init(withInput input: Input) {
    let playerNode = AVAudioPlayerNode()
    let engine = Engine(withInput: input)

    self.input = input
    self.engine = engine
    self.playerNode = playerNode
    self.attachedNodes = []
    self.attach(playerNode)
  }

  func prepareToPlay() throws {
    if self.engine.isActive { return }

    try self.engine.start()
  }

  func play() {
    if !self.engine.isActive || self.isPlaying { return }

    self.playerNode.scheduleBuffer(self.input, at: nil, options: .loops, completionHandler: nil)
    self.playerNode.play()
  }

  func pause() {
    self.playerNode.stop()
    self.engine.pause()
  }

  func stop() {
    self.playerNode.stop()
    self.engine.stop()
  }

  func attach(_ node: AVAudioNode) {
    if self.attachedNodes.contains(node) { return }

    self.engine.output.disconnect(self.attachedNodes)
    self.engine.output.attach(node)
    self.attachedNodes.append(node)
    self.connect(self.attachedNodes)
  }

  func detach(_ node: AVAudioNode) {
    guard let nodeIndex = self.attachedNodes.firstIndex(of: node) else { return }

    self.engine.output.disconnect(self.attachedNodes)
    self.engine.output.detach(node)
    self.attachedNodes.remove(at: nodeIndex)
    self.connect(self.attachedNodes)
  }

  private func connect(_ nodes: [AVAudioNode]) {
    let output = self.engine.output

    output.connect(nodes + [output.mainMixerNode], format: self.input.format)
  }
}
