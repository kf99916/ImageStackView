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

// MARK: - Fileprivate Methods
fileprivate extension ViewController {
    func pickerController(_ picker: UIImagePickerController, didSelect image: UIImage) {
        picker.dismiss(animated: true, completion: nil)
        let imageView = UIImageView(image: image)
        imageStackView.add(imageView: imageView)
    }
}
