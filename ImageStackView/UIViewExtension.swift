//
//  UIViewExtension.swift
//  ImageStackView
//
//  Created by Kf on 2019/7/16.
//  Copyright © 2019 Zheng-Xiang Ke. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func bindEdgesToSuperview() -> Bool {
        guard let superview = superview else {
            return false
        }
        translatesAutoresizingMaskIntoConstraints = false
        ["H:|-0-[subview]-0-|", "V:|-0-[subview]-0-|"].forEach { visualFormat in
            superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        }
        
        return true
    }
}
