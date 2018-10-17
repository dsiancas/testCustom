//
//  IconAlertView.swift
//  RavnAlert
//
//  Created by Daniel on 10/16/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

public class RavnAlert: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconContainerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    
    let nibName = "RavnAlert"
    var otherContentView: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public func setup(title: String, message: String, buttonTitle: String, image: UIImage) {
        titleLabel.text = title
        messageLabel.text = message
        mainButton.titleLabel?.text = buttonTitle
        iconImage.image = image
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.otherContentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(otherContentView)
        
        otherContentView.center = self.center
        otherContentView.autoresizingMask = []
        otherContentView.translatesAutoresizingMaskIntoConstraints = true
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
