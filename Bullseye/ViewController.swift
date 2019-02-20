//
//  ViewController.swift
//  Bullseye
//
//  Created by Swetha on 20/02/19.
//  Copyright © 2019 Swetha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playAgainbtn: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactMode: UISwitch!
    @IBOutlet weak var sliderLabel: UILabel!
    
    var randomNumber = 0
    var sliderFinalValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 100
        startOver()
    }
    
    @IBAction func valueChange(_ sender: Any) {
        playAgainbtn.isHidden = false
        sliderFinalValue = Int(slider.value)
        print(sliderFinalValue)
    }
    
    func startOver(){
        resultLabel.isHidden = true
        playAgainbtn.isHidden = true
        randomNumber = Int(arc4random_uniform(101))
        sliderLabel.text = "Move the slider to: \(randomNumber)"
        slider.value = 50
    }
    @IBAction func playAgain(_ sender: Any) {
        startOver()
    }
    func resultLabelSetup(_ textLab: String, _ BG: UIColor){
        resultLabel.text = textLab
        resultLabel.backgroundColor = BG
    }
    @IBAction func checkAction(_ sender: Any) {
        resultLabel.isHidden = false
        if exactMode.isOn{
            if randomNumber == sliderFinalValue{
                resultLabelSetup("You were right on point bulleye", .green)
            }else{
                resultLabelSetup("Whoops!, Try again", .red)
            }
        }else{
            if (sliderFinalValue - 3) >=  randomNumber || randomNumber <= (sliderFinalValue + 3){
                resultLabelSetup("You were right on point bulleye", .green)
            }else{
                resultLabelSetup("Whoops!, Try again", .red)
            }
        }
        
    }
    
}

