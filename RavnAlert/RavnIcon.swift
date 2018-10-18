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
            return #imageLiteral(resourceName: "icons-close")
        case .edit:
            return #imageLiteral(resourceName: "icons-edit")
        }
    }
}
