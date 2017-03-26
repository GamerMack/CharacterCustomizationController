//
//  ViewController.swift
//  CharacterCustomizationTool
//
//  Created by Aleksander Makedonski on 3/26/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate{

    
    var optionsButtons: [UIButton] = { return UIBuilder.getOptionsButtons() }()
     
     var buttonsEmbbedInSuperview: Bool = false

    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        //Add the options buttons subviews
        addButtonsTo(buttonContainer: self.view)
        
        //Configure constraints for UI elements
        UIBuilder.configureButtonConstraints(buttonGroup: optionsButtons, forViewController: self)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tapRecognizer1 = UIGestureRecognizer(target: self, action: #selector(MainViewController.showHairViewController))
        
        
        let tapRecognizer2 = UIGestureRecognizer(target: self, action: #selector(MainViewController.showShoeViewController))
        
        
        let tapRecognizer3 = UIGestureRecognizer(target: self, action: #selector(MainViewController.showPantsViewController))
        
        tapRecognizer1.delegate = self
        tapRecognizer2.delegate = self
        tapRecognizer3.delegate = self
        
        tapRecognizer1.isEnabled = true
        tapRecognizer2.isEnabled = true
        tapRecognizer3.isEnabled = true
        
//       hairButton.addGestureRecognizer(tapRecognizer1)
//        shoesButton.addGestureRecognizer(tapRecognizer2)
//        pantsButton.addGestureRecognizer(tapRecognizer3)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    
    @objc private func showHairViewController(){
        print("You tapped the hair button")
    }
    
    @objc private func showShoeViewController(){
        print("You tapped the shoes view controller")
    }
    
    @objc private func showPantsViewController(){
        print("You tapped the pants view controller")
    }
    
    

    
    private func addButtonsTo(buttonContainer buttonContainerView: UIView){
        
        for button in self.optionsButtons{
            buttonContainerView.addSubview(button)
        }
        
        buttonsEmbbedInSuperview = true
    }

    
    


}

