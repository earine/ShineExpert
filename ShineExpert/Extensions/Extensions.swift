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

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:0.11, green:0.51, blue:0.50, alpha:1.0), range: range)
        self.attributedText = attribute
    }
}
