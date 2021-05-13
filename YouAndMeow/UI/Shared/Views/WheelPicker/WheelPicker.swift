//
//  WheelPicker.swift
//  YouAndMeow
//
//  Created by Vladimir on 13.05.2021.
//

import SwiftUI

struct WheelPicker: UIViewRepresentable {
  @Binding private (set) var selection: WheelPicker.Selection

  let data: WheelPicker.Data
  let coordinatorType: WheelPickerCoordinator.Type

  init(
    data: WheelPicker.Data,
    selection: Binding<WheelPicker.Selection>,
    coordinatorType: WheelPickerCoordinator.Type
  ) {
    self.data = data
    self._selection = selection
    self.coordinatorType = coordinatorType
  }

  func makeUIView(context: Context) -> UIPickerView {
    let picker = UIPickerView()

    picker.delegate = context.coordinator
    picker.dataSource = context.coordinator

    return picker
  }

  func updateUIView(_ uiView: UIPickerView, context: Context) {
    self.selection.enumerated().forEach { (component, row) in
      uiView.selectRow(row, inComponent: component, animated: true)
    }
  }

  func makeCoordinator() -> WheelPickerCoordinator {
    return self.coordinatorType.init(data: self.data, selection: self.$selection)
  }
}

extension WheelPicker {
  typealias Data = [[Any]]
  typealias Selection = [Int]
}
