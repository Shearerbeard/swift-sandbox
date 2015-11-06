//
//  ViewController.swift
//  Slider Carousel
//
//  Created by Michael Shearer on 11/3/15.
//  Copyright © 2015 Michael Shearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth: CGFloat = self.scrollView.frame.width
        let scrollViewHeight: CGFloat = self.scrollView.frame.height
        
        textView.textAlignment = .Center
        textView.text = "Sweettutos.com is your blog of choice for Mobile Tutorials"
        textView.textColor = .blackColor()
        
        self.startButton.layer.cornerRadius = 4.0
        
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "Slide1")
        imgOne.contentMode = UIViewContentMode.ScaleToFill
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide2")
        imgTwo.contentMode = UIViewContentMode.ScaleToFill
        
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "Slide3")
        imgThree.contentMode = UIViewContentMode.ScaleToFill
        
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth * 3, 0, scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "Slide4")
        imgFour.contentMode = UIViewContentMode.ScaleToFill
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
        
        if Int(currentPage) == 0 {
            textView.text = "I write mobile tutorials mainly targeting iOS"
        } else if Int(currentPage) == 1 {
            textView.text = "And sometimes game tutorials about Unity"
        } else if Int(currentPage) == 2 {
            textView.text = "Keep visiting sweettuttos.com for new coming tutorials, "
        } else {
            textView.text = "and don't forget to subscribe to my blog"
            UIView.animateWithDuration(1.0, animations: {() -> Void in self.startButton.alpha = 1.0 })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

