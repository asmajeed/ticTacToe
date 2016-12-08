//
//  ViewController.swift
//  ticTacToe
//
//  Created by Amer M on 11/18/16.
//  Copyright © 2016 Amer M. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var labOne: GridLabel!
    @IBOutlet weak var labTwo: GridLabel!
    @IBOutlet weak var labThree: GridLabel!
    @IBOutlet weak var labFour: GridLabel!
    @IBOutlet weak var labFive: GridLabel!
    @IBOutlet weak var labSix: GridLabel!
    @IBOutlet weak var labSeven: GridLabel!
    @IBOutlet weak var labEight: GridLabel!
    @IBOutlet weak var labNine: GridLabel!
   
    var labelsArray: [GridLabel] = []
    
    var myGrid = GridLabel()
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        labelsArray = [labOne, labTwo, labThree, labFour,labFive, labSix, labSeven, labEight, labNine]
    }

    @IBAction func screenTapped(_ sender: UITapGestureRecognizer)
    
    {
        print("Screen Tapped")
        
        for label in labelsArray
        {
           //iterate through labelsArray
            if label.frame.contains(sender.location(in: gridView))
            {
                
        if label.canTap == true
            {
                
             if myGrid.xTurn == true
                
            {
                label.text = "🐫"
            }
                else
            {
                label.text = "💩"
            }
            myGrid.xTurn = !myGrid.xTurn
            label.canTap = false
            myGrid.count += 1
            print(myGrid.count)
           
                }
            
            }
        }
 checkWinner()
}
    func checkWinner()
    {
       if ((labOne.text == labTwo.text && labTwo.text == labThree.text) && labOne.text != "")
       //put the parenthesis for each one
        {
        print ("WINNER!")
        self.win(self.labOne.text!)
            
        }
        if ((labFour.text == labFive.text && labFive.text == labSix.text) && labFour.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
            
        }
        if ((labSeven.text == labEight.text && labEight.text == labNine.text) && labSeven.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
        }
        if ((labOne.text == labFour.text && labFour.text == labSeven.text) && labOne.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
        }
        if ((labTwo.text == labFive.text && labFive.text == labEight.text) && labTwo.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
        }
        if ((labThree.text == labSix.text && labSix.text == labNine.text) && labThree.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
        }
        if ((labOne.text == labFive.text && labFive.text == labNine.text) && labOne.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
        }
        if ((labThree.text == labFive.text && labFive.text == labSeven.text) && labThree.text != "")
        
        {
            print ("WINNER!")
            self.win(self.labOne.text!)
        }
        if myGrid.count == 9
        {
            win("No one ")
        }
    }
   
    func win(_ winner:String)
    {
        // desplay alert controller
        let alert = UIAlertController(title: winner + "is the winner ", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let resetButton = UIAlertAction(title: "play again", style: .default, handler:
            {
                (sender) in
                for labels in self.labelsArray
                {
                    labels.text = ""
                    labels.canTap = true
                }
                self.myGrid.xTurn = true
                self.myGrid.count = 0
        })
        alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }
    
    
}
