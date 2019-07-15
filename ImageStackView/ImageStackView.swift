//
//  ImageStackView.swift
//  ImageStackView
//
//  Created by Kf on 2019/7/15.
//  Copyright © 2019 Zheng-Xiang Ke. All rights reserved.
//

import UIKit

struct Layout {
    let left: UInt
    let right: UInt
    let up: UInt
    let down: UInt
}

open class ImageStackView: UIView {

    fileprivate var imageViews: [UIImageView] = []
    fileprivate let maxNumViews = 5
    open var spacing: CGFloat = 5
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

// MARK: - Public Methods
public extension ImageStackView {
    func add(imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTap(sender:)))
        imageView.addGestureRecognizer(singleTap)
        imageViews.append(imageView)
        updateViews()
    }
    
    func remove(at index: Int) {
        imageViews.remove(at: index)
        updateViews()
    }
}

// MARK: - @objc
@objc extension ImageStackView {
    func imageViewDidTap(sender: AnyObject) {
        
    }
}

// MARK: - Fileprivate Methods
fileprivate extension ImageStackView {
    func updateViews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        guard imageViews.count > 0 else {
            return
        }
        
        var groupViews: [[UIView]] = []
        if imageViews.count < maxNumViews {
            groupViews = imageViews.count == 1 ? [imageViews] : [Array(imageViews[0..<1]), Array(imageViews[1..<imageViews.count])]
        }
        else {
            groupViews = [Array(imageViews[0..<2]), Array(imageViews[2..<maxNumViews])]
        }
        
        let subStackViewAxis: NSLayoutConstraint.Axis = imageViews.count < maxNumViews ? .vertical : .horizontal
        let stackViews = groupViews.map { groupView -> UIStackView in
            return newStackView(subViews: groupView, axis: subStackViewAxis)
        }
        
        let allStackView = newStackView(subViews: stackViews, axis: subStackViewAxis == .horizontal ? .vertical : .horizontal)
        allStackView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: frame.size)
        addSubview(allStackView)
    }
    
    func newStackView(subViews: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subViews)
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        return stackView
    }
}
