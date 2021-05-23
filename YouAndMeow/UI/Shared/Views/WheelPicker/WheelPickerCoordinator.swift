//
//  WheelPickerCoordinator.swift
//  YouAndMeow
//

import SwiftUI

protocol WheelPickerCoordinator: UIPickerViewDataSource, UIPickerViewDelegate {
  var data: WheelPicker.Data { get }
  var selection: Binding<WheelPicker.Selection> { get }

  init(data: WheelPicker.Data, selection: Binding<WheelPicker.Selection>)
}
