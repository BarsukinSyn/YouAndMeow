//
//  ImageRepository.swift
//  YouAndMeow
//

import UIKit

final class ImageRepository: StaticClass {
  static func getInfoCenterArtwork() -> UIImage {
    return UIImage(named: "InfoCenterArtwork") ?? UIImage()
  }
}
