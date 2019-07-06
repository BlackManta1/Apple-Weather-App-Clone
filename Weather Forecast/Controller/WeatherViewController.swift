//
//  WeatherViewController.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 02/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var todayLabel: UILabel!
    
    let tableViewIdentifier = "tableViewCell"
    var isLoading = false
    
    var locationManager:CLLocationManager?
    
    var forecasts = [Forecast]()
    var fullDayForecasts = [FullDayForecast]()
    
    var currentCity:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // au debut on fait un clear de tous les elements
        cityLabel.text = ""
        descripLabel.text = ""
        temperatureLabel.text = ""
        todayLabel.text = (DateHelper.load.getDay(date: Date()) ?? "") + " AUJOURD'HUI"
        
        locationProcessing()
        processTableView()
        
        // Pour rajouter une ligne au dessus
        let px = 1 / UIScreen.main.scale
        let frame = CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: px)
        let line = UIView(frame: frame)
        self.tableView.tableHeaderView = line
        line.backgroundColor = self.tableView.separatorColor
        
    }
    
    func getCity(myLocation:CLLocation) {
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(myLocation) { (placemarks, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let placemark = placemarks?[0] {
                    if placemark.locality != nil {
                        self.cityLabel.text = placemark.locality!
                    }
                }
            }
        }
    }
    
    func getWeatherForecast(latitude: Double, longitude: Double) {
        isLoading = true
        let lat = "lat=" + String(latitude)
        let lon = "&lon=" + String(longitude)
        let unit = "&units=metric"
        let language = "&lang=fr"
        let keyAPI = "&APPID=" + API
        let urlString = STARTING_URL + lat + lon + unit + language + keyAPI
        //print(urlString)
        guard let url = URL(string: urlString) else { return }
        
        // Alamofire passe maintenent en AF
        AF.request(url).responseJSON { (responses) in
            if let response = responses.value as? [String:AnyObject] {
                if let list = response["list"] as? NSArray {
                    for element in list {
                        if let dict = element as? [String:AnyObject] {
                            if let main = dict["main"] as? [String:AnyObject] {
                                if let temp = main["temp"] as? Double {
                                    //print("Temperature equals \(temp)")
                                    if let weather = dict["weather"] as? NSArray, weather.count > 0 {
                                        if let currentWeather = weather[0] as? [String:AnyObject] {
                                            if let desc = currentWeather["description"] as? String {
                                                //print(desc)
                                                if let icon = currentWeather["icon"] as? String {
                                                    //print(icon)
                                                    if let date = dict["dt_txt"] as? String {
                                                        //print(date)
                                                        let newForecast = Forecast(temperature: temp, date: date, icon: icon, desc: desc)
                                                        self.forecasts.append(newForecast)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    // Reload data // ---------------- //
                    self.setValueOnMainStoryboard()
                    self.getFullDayForecast()
                }
            }
        }
    }
    
    
    func getFullDayForecast() {
        
        var day = ""
        var icon = ""
        var min = 0.0
        var max = 0.0
        var descrip = ""
        
        for forecast in forecasts {
            
            if forecast.day != "" {
                
                if forecast.day != day {
                    if day != "" {
                        let newDay = FullDayForecast(day: day, icon: icon, min: min, max: max, descrip: descrip)
                        fullDayForecasts.append(newDay)
                    }
                    day = forecast.day
                    icon = forecast.icon
                    min = forecast.temperature
                    max = forecast.temperature
                    descrip = forecast.desc
                    
                } else {
                    // pour recuperer le max et le min
                    if forecast.temperature > max {
                        max = forecast.temperature
                    }
                    
                    if forecast.temperature < min {
                        min = forecast.temperature
                    }
                    
                    if forecast.date.contains("12:") {
                        icon = forecast.icon
                        descrip = forecast.desc
                    }
                }
            }
        }
        isLoading = false
        self.tableView.reloadData()
    }
    
    func setValueOnMainStoryboard() {
        if forecasts.count > 0 {
            let forecast = forecasts[0]
            temperatureLabel.text = forecast.temperature.toInt() + SYMBOL_DEGREE
            descripLabel.text = forecast.desc
            //ImgDownloader.load.imgFrom(stringIcon: forecast.icon, imgView: UIImageView)
            if forecast.icon.contains("d") {
                view.backgroundColor = COLOR_DAY
            } else {
                view.backgroundColor = COLOR_NIGHT
            }
        }
    }
    
}
