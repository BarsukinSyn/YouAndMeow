//
//  TimePickerData.swift
//  YouAndMeow
//
//  Created by Vladimir on 16.05.2021.
//

import Foundation

struct TimePickerData<T: Equatable>: Equatable {
  var hours: T
  var minutes: T
}
