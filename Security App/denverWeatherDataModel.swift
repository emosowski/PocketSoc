//
//  denverWeatherDataModel.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 3/16/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//

import Alamofire

class denverWeatherDataModel {
    
    private var _date: Double?
    private var _temp: String?
    private var _location: String?
    private var _weather: String?
    typealias JSONStandard = Dictionary<String, AnyObject>
    
    let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Denver&appid=cc0f2053f612b7d277bde4fecd2861c3")!
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? "\(dateFormatter.string(from: date))" : "Date Invalid"
    }
    
    var temp: String {
        return _temp ?? "0 °C"
    }
    
    var location: String {
        return _location ?? "Denver"
    }
    
    var weather: String {
        return _weather ?? "Error"
    }
    
    func downloadData(completed: @escaping ()-> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            if let dict = result.value as? JSONStandard, let main = dict["main"] as? JSONStandard, let temp = main["temp"] as? Double, let weatherArray = dict["weather"] as? [JSONStandard], let weather = weatherArray[0]["main"] as? String, let name = dict["name"] as? String, let sys = dict["sys"] as? JSONStandard, let country = sys["country"] as? String, let dt = dict["dt"] as? Double {
                
                self._temp = String(format: "%.0f °F", (temp - 273.15) * 1.8 + 32)
                self._weather = weather
                self._location = "\(name)"
                self._date = dt
            }
            
            completed()
        })
    }
    
}
