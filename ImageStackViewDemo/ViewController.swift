//
//  ViewController.swift
//  ImageStackViewDemo
//
//  Created by Kf on 2019/7/15.
//  Copyright © 2019 Zheng-Xiang Ke. All rights reserved.
//

import UIKit
import ImageStackView

class ViewController: UIViewController {
    
    @IBOutlet weak var imageStackView: ImageStackView!
    fileprivate lazy var imagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {}

// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        pickerController(picker, didSelect: image)
    }
}

// MARK: - @IBAction
extension ViewController {
    @IBAction func imagePickerButtonDidClick(sender: AnyObject) {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

// MARK: - @objc
@objc extension ViewController {
    func imageViewDidClick(sender: AnyObject) {
        guard let gestureRecongnizer = sender as? UITapGestureRecognizer, let imageView = gestureRecongnizer.view as? UIImageView else {
            return
        }
        
        imageStackView.remove(imageView: imageView)
    }
}

// MARK: - Fileprivate Methods
fileprivate extension ViewController {
    func pickerController(_ picker: UIImagePickerController, didSelect image: UIImage) {
        let imageView = UIImageView(image: image)
        imageStackView.add(imageView: imageView, gestureRecognizers: [UITapGestureRecognizer(target: self, action: #selector(imageViewDidClick(sender:)))])
    }
}
