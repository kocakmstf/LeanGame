//
//  Clip.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Clip: Codable {

  enum CodingKeys: String, CodingKey {
    case preview = "preview"
    case video = "video"
    case clips = "clips"
    case clip = "clip"
  }

  var preview: String?
  var video: String?
  var clips: Clips?
  var clip: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    preview = try container.decodeIfPresent(String.self, forKey: .preview)
    video = try container.decodeIfPresent(String.self, forKey: .video)
    clips = try container.decodeIfPresent(Clips.self, forKey: .clips)
    clip = try container.decodeIfPresent(String.self, forKey: .clip)
  }

}
