//
//  ScrollViewController.swift
//  MealTracker
//
//  Created by Georgy Dyagilev on 08/10/2018.
//  Copyright © 2018 Georgy Dyagilev. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        
//        var scale: CGFloat = 1
//        scale = scale * sender.scale
//
//        imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
//        print(scale)
//        if let size = imageView.image?.size {
//            scrollView.contentSize = size
//        }
        
        if sender.state == .began || sender.state == .changed {
            imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
        
        guard let size = imageView.image?.size else { return }
        scrollView.contentSize = size
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor)
//        imageView.centerYAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerYAnchor)
   
        guard let image = image else { return }
        imageView.image = image
    }

}
