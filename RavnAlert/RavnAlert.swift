//
//  IconAlertView.swift
//  RavnAlert
//
//  Created by Daniel on 10/16/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

public enum AlertType {
    case one
    case other
    
    var identifier: String {
        switch self {
        case .one:
            return "RavnAlert"
        case .other:
            return "OtherAlert"
        }
    }
}

public class RavnAlert: UIView {
    
    public typealias ButtonAction = () -> ()
    
    private var alertType: AlertType = .one
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var iconContainerView: UIView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonView: UIView!
    @IBOutlet private weak var mainButton: UIButton!
    
    @IBOutlet private weak var iconView: UIView!
    @IBOutlet private weak var iconImage: UIImageView!
    
    let nibName = "RavnAlert"
    var view: UIView!
    private var buttonAction: ButtonAction = { }
    private var animation = true
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func stylize(cornerRadius: Double, hasShadow: Bool) {
        cardView.layer.cornerRadius = CGFloat(cornerRadius)
        cardView.layer.masksToBounds = true
        if hasShadow {
            cardView.layer.shadowRadius = 15
            cardView.layer.shadowOpacity = 4
        }
    }
    
    public func setup(alertType: AlertType, title: String, message: String, buttonTitle: String, icon: RavnIcon, buttonAction: @escaping ButtonAction) {
        
        setUpView(alertType: alertType)
        
        self.alertType = alertType
        self.titleLabel.text = title
        self.messageLabel.text = message
        self.mainButton.setTitle(buttonTitle, for: .normal)
        self.iconImage.image = icon.image
        self.buttonAction = buttonAction
        
        mainButton.addTarget(self, action:#selector(exitView), for: .touchUpInside)
    }
    
    private func setUpView(alertType: AlertType) {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: alertType.identifier, bundle: bundle)
        self.view = (nib.instantiate(withOwner: self, options: nil).first as! UIView)
        addSubview(self.view)
        
        self.view.center = self.center
        self.view.autoresizingMask = []
        self.view.translatesAutoresizingMaskIntoConstraints = true
        
        self.titleLabel.text = ""
        self.messageLabel.text = ""
        
        mainButton.addTarget(self, action:#selector(exitView), for: .touchUpInside)
    }
    
    public func setupAnimation(position: RavnAnimation) {
        switch position {
        case .right:
            self.cardView.center = CGPoint(x: 0, y: self.view.center.y)
        case .down:
            self.cardView.center = CGPoint(x: self.view.center.x, y: 0)
        default:
            return
        }
        UIView.animate(withDuration: 0.33, animations: {
            self.view.alpha = 0.66
        })
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIView.AnimationOptions(rawValue: 0), animations: {
            self.cardView.center  = self.center
            self.view.alpha = 0.5
        }, completion: { (completed) in
            
        })
    }
    
    @objc private func exitView() {
        self.removeFromSuperview()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
