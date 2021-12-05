//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mac on 29/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    var activePlayer = 1 
    var gameState = [ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]
    let winningCombinantions = [[0,1,2], [3,4,5] , [6,7,8] , [0,3,6], [1,4,7] , [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    @IBAction func action(_ sender: UIButton)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            
            
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1 ) {
                
                sender.backgroundColor = .red
                
                activePlayer = 2
                
            }else {
                
                sender.backgroundColor = .blue
                activePlayer = 1
            }
        }
        for combinantion in winningCombinantions {
            if gameState[combinantion[0]] != 0 &&  gameState[combinantion[0]] ==  gameState[combinantion[1]] && gameState[combinantion[1]] ==  gameState[combinantion[2]] {
               
                gameIsActive = false
                
                if gameState[combinantion[0]] == 1 {
                    winnerLabel.isHidden = false
                    winnerLabel.textColor = .red
                    winnerLabel.text = "Congrats Red Won !"
                }else {
                    winnerLabel.isHidden = false
                    winnerLabel.textColor = .blue
                    winnerLabel.text = "Congrats Blue Won !"
                }
            }
        }
        
        if !gameState.contains(0){
                   winnerLabel.isHidden = false
                   winnerLabel.text = "Its a Draw"
                   winnerLabel.textColor = .black
               }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winnerLabel.isHidden = true
    }


    @IBAction func resetGame(_ sender: UIButton) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        winnerLabel.isHidden = true
        activePlayer = 1
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.backgroundColor = .systemGray2
        }
        
    }
}

