//
//  WeatherViewModel.swift
//  RxWeather
//
//  Created by 최혜선 on 2020/04/28.
//  Copyright © 2020 jamie. All rights reserved.
//

import Foundation

class WeatherViewModel {
    var weather: WeatherItem?
    
    var cityName: String? {
        return weather?.name
    }
    
    var status: String? {
        return "날씨 상태 \(weather?.weather[0].weatherDescription ?? "")"
    }
    
    var temp: String {
        return "기온 \(weather?.main.temp ?? 0)°C"
    }
    
    var windSpped: String {
        return "풍속 \(weather?.wind.speed ?? 0)m/s"
    }
    
    var humidity: String {
        return "습도 \(weather?.main.humidity ?? 0)%"
    }
}
