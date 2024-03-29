
//
//  DrinkHandler.swift
//  DrinkMixer
//
//  Created by Robert S Mozayeni on 9/6/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import Foundation


enum MixedDrinkType: Int {
    case OrangeTriangle
    case Screwdriver
    case CranberryKiss
    case Hurricane
    case HurricanePunch
    case MarinaPunch
    case MyPleasure
    
    static let allValues = [OrangeTriangle, Screwdriver, CranberryKiss, Hurricane, HurricanePunch, MarinaPunch, MyPleasure]
}

class DrinkHandler {
    class func makeDrink(drinkType: MixedDrinkType){
        let manager = AFHTTPRequestOperationManager()
        let params = ["drink":drinkType.toRaw(),"strong":0]
        manager.POST("http://mixerpi.local:5001/makeDrink/", parameters: params, success: { (operation, responseObject) -> Void in
            println("Yay!")
        }) { (operation, error) -> Void in
            println("Noooo \(error.code)")
        }
    }
    class func stringForDrink(drink: MixedDrinkType) -> String{
        switch drink {
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
}