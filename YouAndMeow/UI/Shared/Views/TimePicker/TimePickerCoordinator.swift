//
//  TimePickerCoordinator.swift
//  YouAndMeow
//

import SwiftUI

final class TimePickerCoordinator: NSObject, WheelPickerCoordinator {
  let data: WheelPicker.Data
  private (set) var selection: Binding<WheelPicker.Selection>

  init(data: WheelPicker.Data, selection: Binding<WheelPicker.Selection>) {
    self.data = data
    self.selection = selection
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return self.data.count
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return self.data[component].count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return self.data[component][row] as? String
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.selection.wrappedValue[component] = row
  }
}
