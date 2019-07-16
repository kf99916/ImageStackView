//
//  ImageStackView.swift
//  ImageStackView
//
//  Created by Kf on 2019/7/15.
//  Copyright © 2019 Zheng-Xiang Ke. All rights reserved.
//

import UIKit

open class ImageStackView: UIView {

    open fileprivate(set) var imageViews: [UIImageView] = []
    open var (maxNumViews, numViewsInFirstStack) = (5, 1)
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
    func add(imageView: UIImageView, gestureRecognizers: [UIGestureRecognizer] = []) {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if gestureRecognizers.count > 0 {
            imageView.isUserInteractionEnabled = true
            for gestureRecognizer in gestureRecognizers {
                imageView.addGestureRecognizer(gestureRecognizer)
            }
        }
        
        imageViews.append(imageView)
        updateViews()
    }
    
    func remove(imageView: UIImageView) {
        guard let firstIndex = imageViews.firstIndex(of: imageView) else {
            return
        }
        imageViews.remove(at: firstIndex)
        updateViews()
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
            groupViews = imageViews.count <= numViewsInFirstStack ? [imageViews] : [Array(imageViews[0..<numViewsInFirstStack]), Array(imageViews[numViewsInFirstStack..<imageViews.count])]
        }
        else {
            let diffNumViews = imageViews.count - maxNumViews
            if diffNumViews > 0 {
                let imageViewInMax = imageViews[maxNumViews - 1]
                addBlackOverlay(view: imageViewInMax, text: String(format: "+ %d", diffNumViews))
            }
            
            let numViewsInGroup = Int(Double(maxNumViews) / 2)
            groupViews = [Array(imageViews[0..<numViewsInGroup]), Array(imageViews[numViewsInGroup..<maxNumViews])]
        }
        
        let subStackViewAxis: NSLayoutConstraint.Axis = imageViews.count < maxNumViews ? .vertical : .horizontal
        let stackViews = groupViews.map { groupView -> UIStackView in
            return newStackView(subviews: groupView, axis: subStackViewAxis)
        }
        
        let allStackView = newStackView(subviews: stackViews, axis: subStackViewAxis == .horizontal ? .vertical : .horizontal)
        addSubview(allStackView)
    }
    
    func newStackView(subviews: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        stackView.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        return stackView
    }
    
    func addBlackOverlay(view: UIView, text: String) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        
        guard !text.isEmpty else {
            return
        }
        
        let frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
        let blackOverlay = UIView(frame: frame)
        blackOverlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.addSubview(blackOverlay)
        blackOverlay.bindEdgesToSuperview()
        
        let label = UILabel(frame: frame)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = text
        view.addSubview(label)
        label.bindEdgesToSuperview()
    }
}
