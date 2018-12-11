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
        return colors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    let colors = ["red", "yellow", "green", "blue"]
    @IBOutlet weak var topPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topPickerView.dataSource = self
        topPickerView.delegate = self
        
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
