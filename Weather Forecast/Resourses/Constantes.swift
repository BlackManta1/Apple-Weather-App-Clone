//
//  API.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 02/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import Foundation
import UIKit

let API = "06107de85b7ce791eca782089e143ff7"
let STARTING_URL = "http://api.openweathermap.org/data/2.5/forecast?"
let IMG_URL = "http://openweathermap.org/img/w/"
let IMG_EXT = ".png"
let SYMBOL_DEGREE = "°"

var COLOR_DAY = UIColor(red: 81/255, green: 160/255, blue: 213/255, alpha: 1)
var COLOR_NIGHT = UIColor(red: 3/255, green: 79/255, blue: 132/255, alpha: 1)
// Clear color est tres utile, elle herite de la color de la view principale
