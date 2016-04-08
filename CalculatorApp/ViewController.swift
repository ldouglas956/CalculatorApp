//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Lance Douglas on 4/7/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var outputlbl: UILabel!
	
	var btnSound: AVAudioPlayer!
	
	var runningNumber = ""
	var leftValStr = ""
	var rightVarStr = ""
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// These actions will be implemented when the app has been loaded
		
		let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
		let soundURL = NSURL(fileURLWithPath: path!)
		
		// Swift makes you check to prevent crasing if AVAudioPlayer does not work with sound
		do {
			try	btnSound = AVAudioPlayer(contentsOfURL: soundURL)
			btnSound.prepareToPlay()
		} catch let err as NSError {
			print(err.debugDescription)
		}

	}
	
	@IBAction func numberPressed(btn: UIButton!) {
		
		btnSound.play()
	}
	
	
}

