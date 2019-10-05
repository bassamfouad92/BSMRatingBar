//
//  AnimatedRatingStar.swift
//  AnimatedRatingStar
//
//  Created by Apple on 05/10/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation
import UIKit

protocol AnimatedRatingStarDelegate {
    func onRated( _ rate : Float)
}

@IBDesignable
final class AnimatedRatingStar: UIView {
    
    // MARK: - Properties
    
    @IBInspectable
    var filledStar = UIImage(named:"star_filled")
    
    @IBInspectable
    var unfilledStar = UIImage(named:"star_unfilled")
    
    var stars = [Star]()
    
    var rating : Float = 5.0
    
    var isFilled = false
    
    var starsStack = UIStackView()
    
    var delegate : AnimatedRatingStarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    private func configure() {
       
        //generate starts
        if(stars.count < 1){
            for i in 1...5 {
                let star = Star(frame:CGRect(x:10, y:0, width:50, height: 50))
                    star.image = unfilledStar!
                    star.isFilled = false
                    star.rate = i
                stars.append(star)
            }
        }
        
        //stackview
        starsStack.axis  = .horizontal
        starsStack.distribution  = .equalSpacing
        starsStack.alignment = .fill
        starsStack.spacing   = 16.0
        starsStack.translatesAutoresizingMaskIntoConstraints = false
        
        //Add stars to stackview
        for s in stars {
            starsStack.addArrangedSubview(s)
            s.isUserInteractionEnabled = true
            let tap = StarTapGesture(target: self, action: #selector(self.didTap(recognizer:)))
            tap.star = s
            s.addGestureRecognizer(tap)
        }
        
        self.addSubview(starsStack)
        
        //Constraints
        starsStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        starsStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
       
    }
    
    // MARK: - Actions

    @objc
    func didTap(recognizer: StarTapGesture) {
        
        //animate
        UIView.animate(withDuration: 0.1, animations: {
            recognizer.star!.frame.size.width += 5
            recognizer.star!.frame.size.height += 5
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                recognizer.star!.frame.origin.y -= 5
            }){
                _ in
                UIView.animate(withDuration: 0.1, animations: {
                    recognizer.star!.frame.size.width -= 5
                    recognizer.star!.frame.size.height -= 5
                    recognizer.star!.frame.origin.y += 5
                })
            }
        }
        
        //Logic to choose rating
        let tapedStarTag = recognizer.star!.rate
       
        //clear all stars
         unfilledStarts(stars,unfilledStar!)
        
        //filled starts
        for i in 0..<stars.count {
            if stars[i].rate <= tapedStarTag {
                stars[i].image = filledStar!
                stars[i].isFilled = true
            }
        }
        
        self.delegate?.onRated(Float(tapedStarTag))
        
    }
    
    
}


func unfilledStarts(_ stars : [Star], _ image : UIImage){
    
    //filled stars
    for i in 0..<stars.count {
            stars[i].image = image
            stars[i].isFilled = false
    }
}

class StarTapGesture: UITapGestureRecognizer {
    var star : Star?
}

class Star : UIImageView {
    
    var isFilled = false
    var rate : Int = 0
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
