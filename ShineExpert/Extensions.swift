//
//  File.swift
//  ShineExpert
//
//  Created by Marina Lunts on 19.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2
        //titleLabel?.
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.init(cgColor: 008481 as! CGColor) as! CGColor
    }
    
}

class PlaceHolderColor: UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
}
}

