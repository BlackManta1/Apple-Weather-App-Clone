# Apple-Weather-App-Clone

## Presentation: 
Apple Weather App Clone
Il s'agit d'un exercice dont le but etait de reproduire l'application Meteo Apple installee par defaut.

## Set Up:
- le nom de la ville est recupere grace a un Geocoder.reverse (c'est beaucoup plus precis)
- les temperatures, informations, icones sont recuperes grace a une API. En l'occurence sur [Openweathermap.org](https://openweathermap.org)
- la table View contient deux Prototypes cell : La premiere est une collection view horizontale, la deuxieme est une cell classique avec des labels et une Image View
- les requetes pour recuperer les donnees sous format JSON sont faite via Alamofire.
- le projet a ete realise selon la methode Model - View - Controller
- La seule autorisation demande dans le info.plist est : Privacy - Location When In Use Usage Description

## Screenshot:

<p align="left">
<img src="https://user-images.githubusercontent.com/46055179/60755642-7c2a3e00-a003-11e9-9148-6ae27279e91e.jpeg" width="250">
</p>

## Parse JSON Data:
```swift

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

```

## Credits: 
- [x] Premiere version de l'application terminee le samedi 6 Juillet 2019. (Version 1.00)
- [x] Realise en suivant des enseignements suivit sur la plateforme Udemy.
- [x] Application non publiee sur l'App Store.

###### Copyright © 2019 Saliou DJALO. All rights reserved.

