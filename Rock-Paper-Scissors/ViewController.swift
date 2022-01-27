//
//  ViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Luca Salmi on 2022-01-27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var enemyMoveTetx: UILabel!
    @IBOutlet weak var scissorsBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var isMoveDone = false
    var moveChoice = -1
    let computerOpponent = CpuMove()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func paperClick(_ sender: Any) {
        
        playerMove(id: 0)
    }
    
    @IBAction func scissorsClick(_ sender: Any) {
        
        playerMove(id: 1)
        
    }
    
    @IBAction func rockClick(_ sender: Any) {
        
        playerMove(id: 2)
        
    }
    @IBAction func resetClicked(_ sender: Any) {
        reset()
    }
    
    func playerMove(id: Int){
        if !isMoveDone{
            
            switch id{
                        
                    case 0: moveChoice = id
                    case 1: moveChoice = id
                    case 2: moveChoice = id
                    default: moveChoice = -1
                        
                    }
        }else{
            
            return
        }
        
        
        computerMove()
    }
    
    
    func computerMove(){
     
        isMoveDone = true
        computerOpponent.chooseMove()
        enemyMoveTetx.text = computerOpponent.setText()
        checkWhoWins()
        
    }
    
    func checkWhoWins(){
        
        if moveChoice != -1 || computerOpponent.cpumove != -1{
            
            if moveChoice == computerOpponent.cpumove{
                
                tie()
            
            }else if moveChoice == 0 {
            
                if computerOpponent.cpumove == 1{
                
                    computerWins()
                
                }else{
                
                    playerWins()
                }
            }else if moveChoice == 1 {
            
                if computerOpponent.cpumove == 0{
                
                    playerWins()
                
                }else{
                
                    computerWins()
                }
            }else if moveChoice == 2 {
            
                if computerOpponent.cpumove == 0{
                
                    computerWins()
                
                }else{
                
                    playerWins()
                }
            }
        }else {
            
            tie()
        }
    }
    
    func playerWins(){
        textLabel.text = "You Won, Conglaturations!"
    }
    
    func computerWins(){
        textLabel.text = "You Have Lost, Loser!"
    }
    
    func tie(){
        textLabel.text = "Nobody Wins Today, BORING!"
    }
    
    func reset(){
        
        computerOpponent.cpumove = -1
        moveChoice = -1
        isMoveDone = false
        enemyMoveTetx.text = "Let's Play"
        textLabel.text = ""
    }
}

