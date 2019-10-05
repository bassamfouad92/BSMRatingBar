//
//  ViewController.swift
//  AnimatedRatingStar
//
//  Created by Apple on 05/10/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import UIKit

class ViewController: UIViewController , AnimatedRatingStarDelegate{
    

    @IBOutlet weak var animatedRating: AnimatedRatingStar!
    @IBOutlet weak var ratinglabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.animatedRating.delegate = self
        
    }


    func onRated(_ rate: Float) {
        ratinglabel.text = "Rating is \(rate)"
    }
    
}

