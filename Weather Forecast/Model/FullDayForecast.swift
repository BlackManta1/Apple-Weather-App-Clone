//
//  FullDateForecast.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 05/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import Foundation
import UIKit

class FullDayForecast {
    
    private var _day: String
    private var _icon: String
    private var _min: Double
    private var _max: Double
    private var _descrip:String
    
    var day:String {
        return _day
    }
    var icon: String {
        return _icon
    }
    
    var min: Double {
        return _min
    }
    
    var max: Double {
        return _max
    }
    
    var descrip: String {
        return _descrip
    }
    
    init(day:String, icon:String, min:Double, max:Double, descrip:String) {
        self._day = day
        self._icon = icon
        self._min = min
        self._max = max
        self._descrip = descrip
    }
    
}
