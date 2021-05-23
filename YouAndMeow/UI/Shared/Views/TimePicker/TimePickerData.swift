//
//  TimePickerData.swift
//  YouAndMeow
//

import Foundation

struct TimePickerData<T: Equatable>: Equatable {
  var hours: T
  var minutes: T
}
