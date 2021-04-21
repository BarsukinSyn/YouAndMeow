//
//  ImageRepository.swift
//  YouAndMeow
//
//  Created by Vladimir on 11.04.2021.
//

import UIKit

final class ImageRepository {
  private init() {}

  static func getInfoCenterArtwork() -> UIImage {
    return UIImage(named: "CatsPattern") ?? UIImage()
  }
}
