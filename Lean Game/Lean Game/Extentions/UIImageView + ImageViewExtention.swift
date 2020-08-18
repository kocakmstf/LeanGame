//
//  ImageViewExteniton.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 17.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

public extension UIImageView {
  func setImage(withUrl url: String?, and defaultImage:String) -> Void {
        self.af.cancelImageRequest()
        self.image = UIImage(named: defaultImage as String)
        if let imagePath = URL(string: url ?? ""){
                   self.af.setImage(withURL: imagePath)
               }
        
    }
}

