//
//  CounterLabel.swift
//  RetweetCounter
//
//  Created by usagimaru on 2017.06.17.
//  Copyright © 2017年 usagimaru. All rights reserved.
//

import UIKit

class CounterLabel: UILabel {

	private var _number: Int = 0
	
	var number: Int {
		get {
			return _number
		}
		set {
			func transition() -> CATransition {
				let transition = CATransition()
				transition.type = kCATransitionPush
				transition.duration = 0.3
				transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
				return transition
			}
			
			var anim: CATransition?
			var key = ""
			
			if _number < newValue {
				anim = transition()
				anim?.subtype = kCATransitionFromTop
				key = "increase"
				
			}
			else if _number > newValue {
				anim = transition()
				anim?.subtype = kCATransitionFromBottom
				key = "decrease"
			}
			
			if let anim = anim {
				var newText: String? = nil
				if newValue >= 100000000 {
					newText = "\(newValue / 100000000)億"
				}
				else if newValue >= 10000 {
					newText = "\(newValue / 10000)万"
				}
				else {
					newText = "\(newValue)"
				}
				
				if text != newText {
					layer.removeAllAnimations()
					layer.add(anim, forKey: key)
					text = newText
				}
			}
			
			_number = newValue
		}
	}

}
