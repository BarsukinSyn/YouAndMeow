//
//  Source.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.06.2020.
//  Copyright © 2020 Barsukin syn. All rights reserved.
//

import Foundation

struct Source {
  let file: File

  func readIntoByteBuffer() throws -> Data {
    return try FileManager.readIntoByteBuffer(resource: self.file.name, withExtension: self.file.type)
  }
}
