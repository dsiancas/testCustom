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
        let bundle = Bundle(for: RavnAlert.self)
        switch self {
        case .close:
            return UIImage(named: "icons-close", in: bundle, compatibleWith: nil)!
        case .edit:
            return UIImage(named: "icons-edit", in: bundle, compatibleWith: nil)!
        }
    }
}
