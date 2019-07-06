//
//  DayTableViewCell.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 05/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayImgView: UIImageView!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    
    var day: FullDayForecast!
    
    func processFullDayForecast(dayForecast: FullDayForecast) {
        day = dayForecast
        ImgDownloader.load.imgFrom(stringIcon: day.icon, imgView: dayImgView)
        dayLabel.text = day.day
        maxLabel.text = (day.max).toInt()
        minLabel.text = (day.min).toInt()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
