//
//  Timer.swift
//  YouAndMeow
//

import Foundation

extension Timer {
  static func throttle(delay: TimeInterval, action: @escaping VoidFunction) -> VoidFunction {
    var pending = false

    let throttledAction = {
      if pending { return }

      action()
      pending = true
      Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { (_) in
        pending = false
      }
    }

    return throttledAction
  }

  @discardableResult static func registeredToCommonLoopMode(
    withTimeInterval interval: TimeInterval,
    repeats: Bool,
    block: @escaping (Timer) -> Void
  ) -> Timer {
    let timer = Timer(timeInterval: interval, repeats: repeats, block: block)

    RunLoop.current.add(timer, forMode: .common)

    return timer
  }
}
