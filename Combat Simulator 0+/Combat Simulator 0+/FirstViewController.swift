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
       // Name.text = topPickerView.selectedRow(inComponent: 1)
       // Name.text = String(topPickerView.selectedRow(inComponent: 1))
        nameOfUnitSelected = String(topPickerView.selectedRow(inComponent: 0))
        print(nameOfUnitSelected)
    }
    
    let units = ["Giant", "Prince", "Pekka", "Wizard"]
    @IBOutlet weak var topPickerView: UIPickerView!
    @IBOutlet weak var bottomPickerView: UIPickerView!
    @IBOutlet weak var Name: UILabel!
    var nameOfUnitSelected = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        topPickerView.dataSource = self
        topPickerView.delegate = self
        bottomPickerView.dataSource = self
        bottomPickerView.delegate = self
        
    }
    @IBAction func checkName(_ sender: UIButton) {
        determineSelection()
    }
    func determineSelection() -> String? {
        var playerOne = Unit()
        switch topPickerView.selectedRow(inComponent: 0) {
        case 0:
            Name.text = "Giant"
            playerOne = Giant()
        case 1:
            Name.text = "Prince"
            playerOne = Prince()
        case 2:
            Name.text = "Pekka"
            playerOne = Pekka()
        default:
            Name.text = "Wizard"
            playerOne = Wizard()
        }
        print(playerOne)
        return Name.text
    }
    class Unit {
        var health: Int
        var damage = 1...2
        
        init() {
            health = 1
            damage = 1...2
        }
    }
    class Giant: Unit {
       override init() {
        super.init()
            health = 20
            damage = 1...2
        }
    }
    class Prince: Unit {
        override init() {
            super.init()
            health = 10
            damage = 3...6
        }
    }
    class Pekka: Unit {
        override init() {
            super.init()
            health = 15
            damage = 2...4
        }
    }
    class Wizard: Unit {
        override init() {
            super.init()
            health = 5
            damage = 5...25
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController
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
