//
//  ViewController.swift
//  RetweetCounter
//
//  Created by usagimaru on 2017.06.17.
//  Copyright © 2017年 usagimaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label: CounterLabel!
	@IBOutlet weak var label2: CounterLabel!
	@IBOutlet weak var label3: CounterLabel!
	
	weak var timer: Timer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		label.number = 89
		label2.number = 992
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		
		timer = Timer.scheduledTimer(withTimeInterval: 1.0,
		                             repeats: true,
		                             block: { [weak self] (timer: Timer) in
										self?.label.number += Int(arc4random_uniform(5))
										self?.label2.number += Int(arc4random_uniform(5))
		})
		
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
			self.label3.number = 100000
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

