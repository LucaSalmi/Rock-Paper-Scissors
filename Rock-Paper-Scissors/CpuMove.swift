//
//  CpuMove.swift
//  Rock-Paper-Scissors
//
//  Created by Luca Salmi on 2022-01-27.
//

import Foundation
import UIKit

class CpuMove{
    var cpumove = -1
    
    func chooseMove(){
        cpumove = Int.random(in: 0...2)
    }
    
    func setText() -> String{
        
        switch cpumove{
        case 0:
           return "The CPU Choose Paper"
        case 1:
            return "The CPU Choose Scissors"
        case 2:
            return "The CPU Choose Rock"
        default:
            return "Something Went Wrong"
        }
    }
}
