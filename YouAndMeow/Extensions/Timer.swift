//
//  Timer.swift
//  YouAndMeow
//
//  Created by Vladimir on 15.07.2020.
//

import Foundation

extension Timer {
  static func debounce(delay: TimeInterval, action: @escaping VoidFunction) -> VoidFunction {
    var timer: Timer?

    let debouncedAction = {
      timer?.invalidate()
      timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { (_) in
        action()
      }
    }

    return debouncedAction
  }

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
}
