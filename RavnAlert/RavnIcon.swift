//
//  File.swift
//  RavnAlert
//
//  Created by Daniel on 10/18/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

public enum RavnIcon {
    case close
    case edit
    
    public var image: UIImage {
        switch self {
        case .close:
            return UIImage(imageLiteralResourceName: "icons-close")
        case .edit:
            return UIImage(imageLiteralResourceName: "icons-edit")
        }
    }
}
