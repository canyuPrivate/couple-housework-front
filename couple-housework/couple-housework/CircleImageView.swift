//
//  CircleImageView.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/25.
//

import UIKit
class CircleImageView: UIImageView {
    @IBInspectable var borderColor :  UIColor = UIColor.black
    @IBInspectable var borderWidth :  CGFloat = 0.1

    override var image: UIImage? {
        didSet{
            layer.masksToBounds = false
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
            layer.cornerRadius = frame.height/2
            clipsToBounds = true
        }
    }
}
