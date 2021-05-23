//
//  ShutdownTimePicker.swift
//  YouAndMeow
//

import SwiftUI

struct ShutdownTimePicker: View {
  @EnvironmentObject var shutdownTimer: ShutdownTimerEnvironment

  @ObservedObject var viewData: ShutdownTimePickerViewModel = ShutdownTimePickerViewModel()

  var body: some View {
    ZStack(alignment: .bottom) {
      self.backdrop.cover()

      self.timePicker
        .frame(maxWidth: .infinity)
        .padding(.bottom, 18)
        .background(Color.white)
        .cornerRadius(22, corners: [.topLeft, .topRight])
        .onChange(of: self.viewData.selectedTime, perform: self.viewData.limitTimeSelection(_:))
    }
  }

  private var backdrop: some View {
    Button(action: {}, label: {
      Color.black.opacity(0.5)
    })
  }

  private var timePicker: some View {
    VStack {
      self.actionButtons.overlay(Divider(), alignment: .bottom)

      TimePicker(selection: self.$viewData.selectedTime, options: self.viewData.timePickerOptions)
    }
  }

  private var actionButtons: some View {
    HStack(spacing: 0) {
      ActionButton(label: "Cancel", action: self.shutdownTimer.cancel)
        .overlay(Divider(), alignment: .trailing)

      ActionButton(label: "Set", action: {
        self.shutdownTimer.activate(interval: self.viewData.selectedTimeInterval)
      })
    }
  }
}
