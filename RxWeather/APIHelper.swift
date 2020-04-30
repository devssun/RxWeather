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
    
    private func getCurrentWeatherData(cityName name: String, completion: @escaping(Result<Weather, Error>) -> Void) {
        if let url = URL(string: urlString(cityName: name)) {
            let urlSession = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(.success(weather))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            
            urlSession.resume()
        }
    }
    
    func getCurrentWeatherDataRx(cityName name: String) -> Observable<Weather> {
        return Observable.create { emitter in
            self.getCurrentWeatherData(cityName: name) { result in
                switch result {
                case .success(let weather):
                    emitter.onNext(weather)
                    emitter.onCompleted()
                case .failure(let error):
                    emitter.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
