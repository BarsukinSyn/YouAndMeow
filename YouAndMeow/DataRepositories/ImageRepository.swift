//
//  ImageRepository.swift
//  YouAndMeow
//

import UIKit

final class ImageRepository {
  private init() {}

  static func getInfoCenterArtwork() -> UIImage {
    return UIImage(named: "InfoCenterArtwork") ?? UIImage()
  }
}
