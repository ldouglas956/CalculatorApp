//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Lance Douglas on 4/7/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//
// Created with help from Devslopes and Udemy.com
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	enum Operation: String {
		case Add = "+"
		case Subtract = "-"
		case Multiply = "*"
		case Divide = "/"
		case Empty = "Empty"
		case Clear = "Clear"
	}
	
	@IBOutlet weak var outputlbl: UILabel!
	
	var btnSound: AVAudioPlayer!
	
	var runningNumber = "0.0"
	var leftValStr = ""
	var rightValStr = ""
	var result = ""
	var numResult: Double = 0.0
	var currentOperation: Operation = Operation.Empty
	
	
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
		outputlbl.text = "0"

	}
	
	@IBAction func numberPressed(btn: UIButton!) {
		playSound()
		
		if runningNumber == "0" {
			runningNumber = ""
		}
		runningNumber += "\(btn.tag)"
		outputlbl.text = runningNumber
	}
	
	@IBAction func onAddPressed(sender: UIButton) {
		processOperation(Operation.Add)
	}
	@IBAction func onSubtractPressed(sender: UIButton) {
		processOperation(Operation.Subtract)
	}
	@IBAction func onMultiplyPressed(sender: UIButton) {
		processOperation(Operation.Multiply)
	}
	@IBAction func onDividePressed(sender: UIButton) {
		processOperation(Operation.Divide)
	}
	@IBAction func onEqualsPressed(sender: UIButton) {
		processOperation(currentOperation)
	}
	@IBAction func onClearPressed(sender: UIButton) {
		operationClear()
	}
	
	func processOperation(op: Operation) {
		playSound()
		
		if currentOperation != Operation.Empty {
			//Run some math
			
			if runningNumber != "" {
				
				rightValStr = runningNumber
				runningNumber = ""
				
				if currentOperation == Operation.Add {
					numResult = Double(leftValStr)! + Double(rightValStr)!
					result = String(numResult)
				} else if currentOperation == Operation.Subtract {
					numResult = Double(leftValStr)! - Double(rightValStr)!
					result = String(numResult)
				} else if currentOperation == Operation.Multiply {
					numResult = Double(leftValStr)! * Double(rightValStr)!
					result = String(numResult)
				} else if currentOperation == Operation.Divide {
					numResult = Double(leftValStr)! / Double(rightValStr)!
					result = String(numResult)
				}
				
				leftValStr = result
				outputlbl.text = result
			}
			
			currentOperation = op
			
		} else {
			//This is the first time pressed
			leftValStr = runningNumber
			runningNumber = ""
			currentOperation = op
		}
	}
	
	func operationClear() {
		runningNumber = "0"
		leftValStr = "0"
		rightValStr = "0"
		result = "0"
		outputlbl.text = "0"
		
		currentOperation = Operation.Empty
	}
	
	func playSound() {
		if btnSound.playing {
			btnSound.stop()
		}
		btnSound.play()
	}
	
	
}














