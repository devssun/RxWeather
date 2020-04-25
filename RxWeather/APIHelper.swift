//
//  APIHelper.swift
//  RxWeather
//
//  Created by 최혜선 on 2020/04/24.
//  Copyright © 2020 jamie. All rights reserved.
//

import Foundation
import RxSwift

class APIHelper {
    private let key = "53d71a2411b73bb5251ab401d2f97d15"
    
    private func urlString(cityName: String) -> String {
        return "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(key)&units=metric&lang=kr"
    }
    
    func getCurrentWeatherData(cityName name: String, completion: @escaping(Weather?) -> Void) {
        if let url = URL(string: urlString(cityName: name)) {
            let urlSession = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(Weather.self, from: data)
                        print(json)
                        completion(json)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            urlSession.resume()
        }
    }
}
