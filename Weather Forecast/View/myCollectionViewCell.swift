//
//  myCollectionViewCell.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 04/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var forecast:Forecast!
    
    func processCollectionViewCell(forecast: Forecast) {
        self.forecast = forecast
        ImgDownloader.load.imgFrom(stringIcon: self.forecast.icon, imgView: iconImageView)
        tempLabel.text = self.forecast.temperature.toInt() + SYMBOL_DEGREE
        let stringDay = DateHelper.load.getShortDayName(stringDay: self.forecast.day) ?? ""
        descripLabel.text = stringDay + " " + (DateHelper.load.getHour(self.forecast.date) ?? "")
        
        // on peut egalement ajouter dans la description si on le souhaite le self.forecast.desc
    }
    
}
