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
    
    var image: UIImage {
        switch self {
        case .close:
            return UIImage(cgImage: #imageLiteral(resourceName: "icons-close").cgImage!)
        case .edit:
            return UIImage(cgImage: #imageLiteral(resourceName: "icons-edit").cgImage!)
        }
    }
}
