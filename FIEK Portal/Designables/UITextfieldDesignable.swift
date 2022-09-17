//
//  UITextfieldDesignable.swift
//  FIEK Portal
//
//  Created by Fisnik on 17/09/2022.
//

import UIKit

@IBDesignable
class UITextfieldDesignable: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
