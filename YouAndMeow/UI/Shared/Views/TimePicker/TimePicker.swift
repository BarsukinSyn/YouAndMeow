//
//  TimePicker.swift
//  YouAndMeow
//
//  Created by Vladimir on 14.05.2021.
//

import SwiftUI

struct TimePicker: View {
  @Binding private (set) var selection: WheelPicker.Selection

  var timeLimits: [Int] = [13, 60]
  var timeLabels: [String] = ["h", "m"]

  var pickerData: WheelPicker.Data {
    self.timeLimits.map { (limit) in
      Array(repeating: "", count: limit).enumerated().map { (index, _) in "\(index)" }
    }
  }

  var body: some View {
    self.template.fixedSize(horizontal: true, vertical: false)
  }

  var template: some View {
    ZStack {
      self.wheelPicker

      self.wheelLabels
        .padding(.horizontal, 10)
        .opacity(0.4)
    }
  }

  var wheelPicker: some View {
    WheelPicker(
      data: self.pickerData,
      selection: self.$selection,
      coordinatorType: TimePickerCoordinator.self
    )
  }

  var wheelLabels: some View {
    HStack(spacing: 34) {
      ForEach(self.timeLabels, id: \.self) {
        Text($0)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .padding(.horizontal, 34)
      }
    }
  }
}
