//
//  DetailController.swift
//  TetoFeed
//
//  Created by Fernando Augusto de Marins on 30/04/17.
//  Copyright © 2017 Fernando Augusto de Marins. All rights reserved.
//

import UIKit
import SDWebImage

class DetailController: UIViewController, UIScrollViewDelegate {
    
    var post: Post? {
        didSet {
            if let familyName = post?.familyName {
                self.familyName.text = familyName
            }
            
            if let familyText = post?.familyText {
                self.familyText.text = familyText
            }
            
            if let familyImage = post?.familyImage {
                self.familyImage.sd_setImage(with: URL(string: familyImage), placeholderImage: UIImage(named: "placeholder"))
            }
        }
    }

    override func viewDidLoad() {
        navigationItem.title = "Info"
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.white
        setupViews()
    }
    
    let familyName: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Roboto-Regular", size: 20)
        textView.textColor = UIColor.rgb(0, green: 0, blue: 0, alpha: 0.7)
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    let familyText: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Roboto-Regular", size: 12)
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.rgb(0, green: 0, blue: 0, alpha: 0.7)
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    let familyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    // TODO: Add scroll view to display bigger texts
    
    func setupViews() {
        
        view.addSubview(familyName)
        view.addSubview(familyText)
        view.addSubview(familyImage)
        
        view.bringSubview(toFront: familyName)
        view.bringSubview(toFront: familyText)
        
        familyImage.setShowActivityIndicator(true)
        familyImage.setIndicatorStyle(.gray)
        
        view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: familyName)
        view.addConstraintsWithFormat("H:|[v0]|", views: familyImage)
        view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: familyText)
        
        if let navHeight = navigationController?.navigationBar.frame.height {
            view.addConstraintsWithFormat("V:|-\(navHeight + 22)-[v0]-2-[v1(200)]-2-[v2]->=8-|", views: familyName, familyImage, familyText)
        }
        
    }
    
}
