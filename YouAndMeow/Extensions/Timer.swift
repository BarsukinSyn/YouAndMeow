//
//  Timer.swift
//  YouAndMeow
//
//  Created by Vladimir on 15.07.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

extension Timer {
  typealias VoidFunction = () -> Void

  static func throttle(wait: TimeInterval, action: @escaping VoidFunction) -> VoidFunction {
    var pending = false
    let wrappedAction = {
      if pending { return }

      action()
      pending = true
      Timer.scheduledTimer(withTimeInterval: wait, repeats: false) { (_) in
        pending = false
      }
    }

    return wrappedAction
  }
}
