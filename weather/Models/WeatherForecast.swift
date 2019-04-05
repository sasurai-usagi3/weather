//
//  Weather.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation

struct WeatherForecast {
    let date: Date
    let telop: String // 予想される天気。パターンがわからないから一旦String
    let minTemperature: Double? // 最低気温(セ氏)。なぜかnullable
    let maxTemperature: Double? // 最高気温(セ氏)。なぜかnullable
    
    static func from(json: JsonWeather.JsonWeatherForecast) -> WeatherForecast {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: json.date)
        let minTemperature = (json.temperature.min != nil) ? Double(json.temperature.min!.celsius) : nil
        let maxTemperature = (json.temperature.max != nil) ? Double(json.temperature.max!.celsius) : nil
        
        return WeatherForecast(date: date!, telop: json.telop, minTemperature: minTemperature, maxTemperature: maxTemperature)
    }
}
