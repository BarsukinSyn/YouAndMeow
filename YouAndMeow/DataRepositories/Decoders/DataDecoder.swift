//
//  DataDecoder.swift
//  YouAndMeow
//

import Foundation

final class DataDecoder: StaticClass {
  static func decodePropertyList<T: Decodable>(_ data: Data) throws -> T {
    do {
      let decodedData = try PropertyListDecoder().decode(T.self, from: data)

      return decodedData
    } catch {
      throw DataDecoder.Exception.unexpectedDataType
    }
  }

  static func decodeJSON<T: Decodable>(_ data: Data) throws -> T {
    do {
      let decodedData = try JSONDecoder().decode(T.self, from: data)

      return decodedData
    } catch {
      throw DataDecoder.Exception.unexpectedDataType
    }
  }
}

extension DataDecoder {
  enum Exception: Error {
    case unexpectedDataType
  }
}
