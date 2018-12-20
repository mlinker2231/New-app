//
//  FirstViewController.swift
//  Combat Simulator 0+
//
//  Created by Michael Linker on 12/11/18.
//  Copyright © 2018 John Hersey Highschool. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameOfUnitSelected = String(topPickerView.selectedRow(inComponent: 0))
        Player1Name.text = determineSelectionForPlayer1()
        Player2Name.text = determineSelectionForPlayer2()
        print(nameOfUnitSelected)
    }
    
    @IBOutlet weak var Player2Name: UILabel!
    @IBOutlet weak var Player1Name: UILabel!
    let units = ["Giant", "Prince", "Pekka", "Wizard"]
    @IBOutlet weak var topPickerView: UIPickerView!
    @IBOutlet weak var bottomPickerView: UIPickerView!
    var nameOfUnitSelected = ""
    var player1 = Unit()
    var player2 = Unit()
    override func viewDidLoad() {
        super.viewDidLoad()
        topPickerView.dataSource = self
        topPickerView.delegate = self
        bottomPickerView.dataSource = self
        bottomPickerView.delegate = self
        
    }
    func determineSelectionForPlayer1() -> String? {
        switch topPickerView.selectedRow(inComponent: 0) {
        case 0:
            Player1Name.text = "Giant"
            player1 = Giant()
        case 1:
            Player1Name.text = "Prince"
            player1 = Prince()
        case 2:
            Player1Name.text = "Pekka"
            player1 = Pekka()
        case 3:
            Player1Name.text = "Wizard"
            player1 = Wizard()
        default:
            Player1Name.text = "Giant"
            player1 = Giant()
        }
        print(player1)
        return Player1Name.text
    }
    func determineSelectionForPlayer2() -> String? {
        switch bottomPickerView.selectedRow(inComponent: 0) {
        case 0:
            Player2Name.text = "Giant"
            player2 = Giant()
        case 1:
            Player2Name.text = "Prince"
            player2 = Prince()
        case 2:
            Player2Name.text = "Pekka"
            player2 = Pekka()
        case 3:
            Player2Name.text = "Wizard"
            player2 = Wizard()
        default:
            Player2Name.text = "Giant"
            player2 = Giant()
        }
        print(player2)
        return Player2Name.text
    }
    class Unit {
        var health: Int
        var damage = 1...2
        var ability = ""
        init() {
            health = 1
            damage = 1...2
            ability = ""
        }
    }
    class Giant: Unit {
        override init() {
            super.init()
            health = 40
            damage = 1...3
            ability = "Stonewall"
        }
    }
    class Prince: Unit {
        override init() {
            super.init()
            health = 20
            damage = 2...6
            ability = "Stun"
        }
    }
    class Pekka: Unit {
        override init() {
            super.init()
            health = 30
            damage = 2...4
            ability = "Spikey Armor"
        }
    }
    class Wizard: Unit {
        override init() {
            super.init()
            health = 8
            damage = 5...15
            ability = "FireBall"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue1" {
        let nvc = segue.destination as! ViewController
        determineSelectionForPlayer2()
        determineSelectionForPlayer1()
        nvc.p1damage = player1.damage
        nvc.p1health = player1.health
        nvc.p1Name = Player1Name.text!
        nvc.p2Name = Player2Name.text!
        nvc.p2damage = player2.damage
        nvc.p2health = player2.health
        nvc.p2ability = player2.ability
        nvc.p1ability = player1.ability
    }
    }
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
