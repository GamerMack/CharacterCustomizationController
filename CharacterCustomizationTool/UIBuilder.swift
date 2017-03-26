//
//  UIBuilder.swift
//  CharacterCustomizationTool
//
//  Created by Aleksander Makedonski on 3/26/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit


class UIBuilder{
    static func createTextForButton(button: UIButton, withTextOf text: String){
        let buttonLabel = UILabel(frame: button.bounds)
        button.addSubview(buttonLabel)
        
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let c1 = buttonLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        let c2 = buttonLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        let c3 = buttonLabel.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 0.80)
        let c4 = buttonLabel.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 0.90)
        
        
        NSLayoutConstraint.activate([c1, c2, c3, c4 ])
        buttonLabel.textAlignment = .center
        buttonLabel.textColor = UIColor.blue
        buttonLabel.font = UIFont(name: "AmericanTypewriter", size: 50.0)
        buttonLabel.text = text
    }
    
    
    static func getOptionsButtons() -> [UIButton]{
        var buttonsArray = [UIButton]()
        
        //Add buttons for character configuration
        let shoesButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: shoesButton, withTextOf: "Shoes")
        shoesButton.backgroundColor = UIColor.orange
        
        let shirtButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: shirtButton, withTextOf: "Shirt")
        shirtButton.backgroundColor = UIColor.orange
        
        let pantsButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: pantsButton, withTextOf: "Pants")
        pantsButton.backgroundColor = UIColor.orange
        
        let hairButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: hairButton, withTextOf: "Hair")
        hairButton.backgroundColor = UIColor.orange
        
        let headButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: headButton, withTextOf: "Head")
        headButton.backgroundColor = UIColor.orange
        
        let handsButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: handsButton, withTextOf: "Hands")
        handsButton.backgroundColor = UIColor.orange
        
        let legsButton = UIButton(type: .roundedRect)
        UIBuilder.createTextForButton(button: legsButton, withTextOf: "Legs")
        legsButton.backgroundColor = UIColor.orange
        
        buttonsArray.append(shoesButton)
        buttonsArray.append(shirtButton)
        buttonsArray.append(pantsButton)
        buttonsArray.append(hairButton)
        buttonsArray.append(headButton)
        buttonsArray.append(handsButton)
        buttonsArray.append(legsButton)
        
        return buttonsArray
        
    }
    
    static func configureButtonConstraints(buttonGroup: [UIButton], forViewController viewController: UIViewController){
        
        
        //Constaints for button height and width
        let buttonSuperview = buttonGroup[0].superview ?? viewController.view
        
        let numberOfButtons = buttonGroup.count
        
        var buttonConstraints = [NSLayoutConstraint]()
        
        let heightConstraintMultiplier = (1/CGFloat(numberOfButtons))*0.70
        
        for buttonIndex in 0..<buttonGroup.count{
            
            //References to current button as well as the buttons above and below the current button
            
            let previousButton: UIButton? = (buttonIndex > 0) ? buttonGroup[buttonIndex-1] : nil
            let nextButton: UIButton? =  (buttonIndex < buttonGroup.count-1) ? buttonGroup[buttonIndex+1] : nil
            
            let currentButton = buttonGroup[buttonIndex]
            
            
            
            //Tunr off autoresizing mask
            currentButton.translatesAutoresizingMaskIntoConstraints = false
            
            if let previousButton = previousButton{
                previousButton.translatesAutoresizingMaskIntoConstraints = false
            }
            
            if let nextButton = nextButton{
                nextButton.translatesAutoresizingMaskIntoConstraints = false
            }
            
            
            
            //Configure the top constraint for the button
            
            let topmostAnchor = (buttonSuperview == viewController.view) ? viewController.topLayoutGuide.bottomAnchor : buttonSuperview!.topAnchor
            
            
            let topConstraint = (buttonIndex == 0) ? currentButton.topAnchor.constraint(greaterThanOrEqualTo: topmostAnchor, constant: 10.00) :
                currentButton.topAnchor.constraint(greaterThanOrEqualTo: previousButton!.bottomAnchor, constant: 10.00)
            
            let centerXConstraint = currentButton.centerXAnchor.constraint(equalTo: buttonSuperview!.centerXAnchor)
            
            let widthConstraint = currentButton.widthAnchor.constraint(equalTo: buttonSuperview!.widthAnchor, multiplier: 0.80)
            
            let heightConstraint = currentButton.heightAnchor.constraint(equalTo: buttonSuperview!.heightAnchor, multiplier: heightConstraintMultiplier)
            
            buttonConstraints.append(topConstraint)
            buttonConstraints.append(centerXConstraint)
            buttonConstraints.append(widthConstraint)
            buttonConstraints.append(heightConstraint)
        }
        
        
        
        NSLayoutConstraint.activate(buttonConstraints)
    }
    

}
