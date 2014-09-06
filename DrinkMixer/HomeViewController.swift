//
//  HomeViewController.swift
//  DrinkMixer
//
//  Created by Robert S Mozayeni on 9/6/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var currentFavoriteLabel: UILabel!
    @IBOutlet var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countElements(MixedDrinkType.allValues)
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let type: MixedDrinkType = MixedDrinkType.fromRaw(row)!
        switch type {
        case .OrangeTriangle:
            return "Orange Triangle"
        case .Screwdriver:
            return "Screwdriver"
        case .CranberryKiss:
            return "Cranberry Kiss"
        case .Hurricane:
            return "Hurricane"
        case .HurricanePunch:
            return "Hurricane Punch"
        case .MarinaPunch:
            return "Marina Punch"
        case .MyPleasure:
            return "My Pleasure"
        default:
            return "¯\\_(ツ)_/¯"
            
        }
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }

    @IBAction func setFavorite(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setInteger(self.picker.selectedRowInComponent(0), forKey: "fav")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    @IBAction func make(sender: UIButton) {
    }
}
