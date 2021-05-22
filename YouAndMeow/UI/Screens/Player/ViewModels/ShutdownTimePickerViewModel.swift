//
//  ShutdownTimePickerViewModel.swift
//  YouAndMeow
//
//  Created by Vladimir on 27.05.2021.
//

import Foundation

final class ShutdownTimePickerViewModel: ObservableObject {
  @Published var selectedTime: TimeSelection = TimeSelection(hours: 0, minutes: 15)

  var selectedTimeInterval: TimeInterval {
    TimeInterval(self.selectedTime.hours * 60 * 60 + self.selectedTime.minutes * 60)
  }

  let timePickerOptions: TimeOptions = TimeOptions(hours: 12, minutes: 59)

  func limitTimeSelection(_ time: TimeSelection) {
    if time.hours == 0, time.minutes == 0 { self.selectedTime.minutes = 1 }
    if time.hours == self.timePickerOptions.hours, time.minutes > 0 { self.selectedTime.minutes = 0 }
  }
}
