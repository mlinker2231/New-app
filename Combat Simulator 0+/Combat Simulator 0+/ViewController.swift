//
//  ViewController.swift
//  Combat Simulator 0+
//
//  Created by Michael Linker on 12/11/18.
//  Copyright © 2018 John Hersey Highschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var PlayerOneImage: UIImageView!
    @IBOutlet weak var PlayerTwoImage: UIImageView!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player2Health: UILabel!
    @IBOutlet weak var player2Damage: UILabel!
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player1Health: UILabel!
    @IBOutlet weak var player1Damage: UILabel!
    @IBOutlet weak var Instructions: UILabel!
    var p2damage: ClosedRange = 1...2
    var p2health: Int = 2
    var p2Name: String = ""
    var p1damage: ClosedRange = 1...2
    var p1health: Int = 2
    var p1Name: String = ""
    var player1Turn = false
    var player2Turn = false
    var decideTurn = true
    var p1Ability = ""
    var p2ability = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Name.text = "Name:" +  p1Name
        player1Damage.text = "Damage:" + String(p1damage.lowerBound) + "..." + String(p1damage.upperBound)
        player1Health.text = "Health:" + String(p1health)
        player2Name.text = "Name: " +  p2Name
        player2Damage.text = "Damage:" + String(p2damage.lowerBound) + "..." + String(p2damage.upperBound)
        player2Health.text = "Health:" + String(p2health)
        PlayerTwoImage.image = UIImage(named: String(p2Name))
        PlayerOneImage.image = UIImage(named: String(p1Name))
    }
    @IBAction func PlayerOneAttacks(_ sender: Any) {
        if player1Turn {
            p2health -= p1damage.randomElement()!
            player2Health.text = "Health:" + String(p2health)
            player2Turn = true
            player1Turn = false
            Instructions.text = "Player Two Your Turn"
            PlayerTwoImage.alpha -= 0.05
            if p2health <= 0 {
                p2health = 0
                PlayerTwoImage.alpha = 0.0
                Instructions.text = "Player One Wins!"
                player2Turn = false
            }
        }
    }
    @IBAction func PlayerTwoAttacks(_ sender: Any) {
        if player2Turn {
            p1health -= p2damage.randomElement()!
            player1Health.text = "Health:" + String(p1health)
            player1Turn = true
            player2Turn = false
            Instructions.text = "Player one your turn"
            if p1health <= 0 {
                p1health = 0
                PlayerOneImage.alpha = 0.0
                Instructions.text = "Player Two Wins!"
                player1Turn = false
            }

        }
    }
    @IBAction func DecideTurn(_ sender: Any) {
        flipCoin()
        if player2Turn {
            Instructions.text = "Player Two You Attack First!"
        }else {
            Instructions.text = "Player One You Attack First!"
        }
    }
    func flipCoin() {
        if decideTurn {
            let sequence = 1...2
            let randomNumber = sequence.randomElement()
            if randomNumber == 1 {
                player1Turn = true
            }else {
                player2Turn = true
            }
            decideTurn = false
        }
    }
    
}

