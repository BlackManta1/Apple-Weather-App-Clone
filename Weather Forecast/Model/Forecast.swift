//
//  Forecast.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 03/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import Foundation
import UIKit

class Forecast {
    
    private var _temperature:Double
    private var _date:String
    private var _icon:String
    private var _desc:String
    private var _day:String
    
    var temperature:Double {
        return _temperature
    }
    
    var date:String {
        return _date
    }
    
    var icon:String {
        return _icon
    }
    
    var desc:String {
        return _desc
    }
    
    var day:String {
        return _day
    }
    
    init(temperature:Double, date:String, icon:String, desc:String) {
        self._temperature = temperature
        self._date = date
        self._icon = icon
        self._desc = desc
        self._day = DateHelper.load.dayOfWeek(stringValue: _date) ?? ""
        //print(_day)
    }
    
    
}
