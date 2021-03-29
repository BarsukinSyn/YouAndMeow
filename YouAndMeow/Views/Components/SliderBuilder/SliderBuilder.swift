//
//  SliderBuilder.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.01.2021.
//

import SwiftUI

struct SliderBuilder<V: View>: View {
  @Binding var value: Float

  private let bounds: ClosedRange<Float>
  private let thumbWidth: CGFloat?
  private let renderSliderTemplate: RenderFunction<SliderComponentModifiers, V>

  init(
    value: Binding<Float>,
    in bounds: ClosedRange<Float>,
    thumbWidth: CGFloat? = nil,
    _ renderSliderTemplate: @escaping RenderFunction<SliderComponentModifiers, V>
  ) {
    self._value = value
    self.bounds = bounds
    self.thumbWidth = thumbWidth
    self.renderSliderTemplate = renderSliderTemplate
  }

  var body: some View {
    GeometryReader { (geometry) in
      self.buildSlider(in: geometry.frame(in: .global))
    }
  }

  private func buildSlider(in frame: CGRect) -> some View {
    let trackLength = Float(self.getTrackLength(in: frame))

    let thumbWidth = self.getThumbWidth(in: frame)
    let thumbSize = CGSize(width: thumbWidth, height: frame.height)
    let thumbOffset = CGFloat(self.value.mappedBetweenRanges(initial: self.bounds, target: 0...trackLength))

    let minimumTrackSize = CGSize(width: thumbOffset + thumbWidth / 2, height: frame.height)
    let maximumTrackSize = CGSize(width: frame.width - minimumTrackSize.width, height: frame.height)

    let thumbModifier = SliderComponentModifier(size: thumbSize, offset: thumbOffset)
    let minimumTrackModifier = SliderComponentModifier(size: minimumTrackSize, offset: 0)
    let maximumTrackModifier = SliderComponentModifier(size: maximumTrackSize, offset: minimumTrackSize.width)

    let componentStyles = SliderComponentModifiers(
      thumb: thumbModifier,
      minimumTrack: minimumTrackModifier,
      maximumTrack: maximumTrackModifier
    )

    let dragGesture = DragGesture(minimumDistance: 0).onChanged { (gesture) in
      self.dragGestureHandler(gesture, in: frame)
    }

    let sliderView = self.renderSliderTemplate(componentStyles).gesture(dragGesture)

    return sliderView
  }

  private func getTrackLength(in frame: CGRect) -> CGFloat {
    let thumbWidth = self.getThumbWidth(in: frame)
    let trackLength = frame.width - thumbWidth

    return trackLength
  }

  private func getThumbWidth(in frame: CGRect) -> CGFloat {
    return self.thumbWidth ?? frame.height
  }

  private func dragGestureHandler(_ gesture: DragGesture.Value, in frame: CGRect) {
    let thumbWidth = self.getThumbWidth(in: frame)
    let trackLength = Float(self.getTrackLength(in: frame))
    let dragLength = gesture.startLocation.x + gesture.translation.width
    let thumbPosition = Float(dragLength - thumbWidth / 2).clamped(0...trackLength)
    let value = thumbPosition.mappedBetweenRanges(initial: 0...trackLength, target: self.bounds)

    self.value = value
  }
}
