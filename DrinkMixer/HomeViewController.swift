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
        updateLabel()
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
        return DrinkHandler.stringForDrink(type)
    }
    
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }

    @IBAction func setFavorite(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setInteger(self.picker.selectedRowInComponent(0), forKey: "fav")
        NSUserDefaults.standardUserDefaults().synchronize()
        updateLabel()
    }
    @IBAction func make(sender: UIButton) {
        DrinkHandler.makeDrink(MixedDrinkType.fromRaw(self.picker.selectedRowInComponent(0))!)
    }
    
    func updateLabel(){
        let thing = NSUserDefaults.standardUserDefaults().integerForKey("fav")
        self.currentFavoriteLabel.text = "Current favorite: \(DrinkHandler.stringForDrink(MixedDrinkType.fromRaw(thing)!))"
    }
}
