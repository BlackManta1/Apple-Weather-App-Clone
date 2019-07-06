//
//  TableViewExtension.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 04/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import Foundation
import UIKit

extension WeatherViewController : UITableViewDelegate, UITableViewDataSource {
    
    func processTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fullDayForecasts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as? TableViewForecastCell {
                cell.collectionViewProcess(forecasts: forecasts)
                return cell
            }
            
        } else {
            let forecast = fullDayForecasts[indexPath.row - 1]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as? DayTableViewCell {
                cell.processFullDayForecast(dayForecast: forecast)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 160
        } else {
            return 60
        }
        
    }
    
}
