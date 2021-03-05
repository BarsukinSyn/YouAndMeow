//
//  SoundtrackMap.swift
//  YouAndMeow
//
//  Created by Vladimir on 25.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

struct SoundtrackMap: Decodable {
  let markers: [TimeInterval]

  func getRandomFragment() -> SoundFragment {
    let randomIndex = Int.random(in: 0 ..< self.markers.count - 1)
    let fragment = SoundFragment(start: self.markers[randomIndex], end: self.markers[randomIndex + 1])

    return fragment
  }
}
