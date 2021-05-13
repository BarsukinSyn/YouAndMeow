//
//  SliderBuilder.swift
//  YouAndMeow
//
//  Created by Vladimir on 21.01.2021.
//

import SwiftUI

struct SliderBuilder<T: View>: View {
  @Binding private (set) var value: Float

  var bounds: ClosedRange<Float>
  var thumbWidth: CGFloat? = nil
  var renderSliderTemplate: RenderFunction<SliderTemplateModifiers, T>

  var body: some View {
    GeometryReader { (geometry) in
      self.buildSlider(in: geometry.frame(in: .global))
    }
  }

  private func buildSlider(in frame: CGRect) -> some View {
    let trackLength = self.getTrackLength(in: frame)

    let thumbWidth = self.getThumbWidth(in: frame)
    let thumbSize = CGSize(width: thumbWidth, height: frame.height)
    let thumbOffset = CGFloat(self.value.mappedBetweenRanges(initial: self.bounds, target: 0 ... trackLength))

    let minimumTrackSize = CGSize(width: thumbOffset + thumbWidth / 2, height: frame.height)
    let maximumTrackSize = CGSize(width: frame.width - minimumTrackSize.width, height: frame.height)

    let thumbModifier = SliderComponentModifier(size: thumbSize, offset: thumbOffset)
    let minimumTrackModifier = SliderComponentModifier(size: minimumTrackSize, offset: 0)
    let maximumTrackModifier = SliderComponentModifier(size: maximumTrackSize, offset: minimumTrackSize.width)

    let sliderTemplateModifiers = SliderTemplateModifiers(
      thumb: thumbModifier,
      minimumTrack: minimumTrackModifier,
      maximumTrack: maximumTrackModifier
    )

    let dragGesture = DragGesture(minimumDistance: 1).onChanged { (gesture) in
      self.handleDragGesture(gesture, in: frame)
    }

    let sliderView = self.renderSliderTemplate(sliderTemplateModifiers).gesture(dragGesture)

    return sliderView
  }

  private func getTrackLength(in frame: CGRect) -> Float {
    let thumbWidth = self.getThumbWidth(in: frame)
    let trackLength = Float(frame.width - thumbWidth)

    return trackLength
  }

  private func getThumbWidth(in frame: CGRect) -> CGFloat {
    return self.thumbWidth ?? frame.height
  }

  private func handleDragGesture(_ gesture: DragGesture.Value, in frame: CGRect) {
    let thumbWidth = self.getThumbWidth(in: frame)
    let trackLength = self.getTrackLength(in: frame)
    let dragLength = gesture.startLocation.x + gesture.translation.width
    let thumbPosition = Float(dragLength - thumbWidth / 2).clamped(0 ... trackLength)
    let value = thumbPosition.mappedBetweenRanges(initial: 0 ... trackLength, target: self.bounds)

    self.value = value
  }
}
