//
//  TimePicker.swift
//  YouAndMeow
//

import SwiftUI

struct TimePicker: View {
  @Binding private (set) var selection: TimePickerData<Int>

  var options: TimePickerData<Int> = TimePickerData(hours: 23, minutes: 59)
  var labels: TimePickerData<String> = TimePickerData(hours: "h", minutes: "m")

  private var pickerData: WheelPicker.Data {
    [self.options.hours, self.options.minutes].map { (limit) in
      Array(repeating: "", count: limit + 1).enumerated().map { (index, _) in "\(index)" }
    }
  }

  private var bindedPickerSelection: Binding<WheelPicker.Selection> {
    Binding(
      get: { [self.selection.hours, self.selection.minutes] },
      set: { (pickerSelection) in
        if let hours = pickerSelection.first, let minutes = pickerSelection.last {
          self.selection = TimePickerData(hours: hours, minutes: minutes)
        }
      }
    )
  }

  var body: some View {
    self.template.fixedSize(horizontal: true, vertical: false)
  }

  private var template: some View {
    ZStack {
      self.wheelPicker

      self.wheelLabels
        .padding(.horizontal, 10)
        .opacity(0.4)
    }
  }

  private var wheelPicker: some View {
    WheelPicker(
      data: self.pickerData,
      selection: self.bindedPickerSelection,
      coordinatorType: TimePickerCoordinator.self
    )
  }

  private var wheelLabels: some View {
    HStack(spacing: 34) {
      ForEach([self.labels.hours, self.labels.minutes], id: \.self) {
        Text($0)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .padding(.horizontal, 34)
      }
    }
  }
}
