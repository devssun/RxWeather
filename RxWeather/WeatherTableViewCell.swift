//
//  WeatherTableViewCell.swift
//  RxWeather
//
//  Created by 최혜선 on 2020/04/24.
//  Copyright © 2020 jamie. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var cityLabel: UILabel!
    @IBOutlet fileprivate weak var statusLabel: UILabel!
    @IBOutlet fileprivate weak var tempLabel: UILabel!
    @IBOutlet fileprivate weak var windLabel: UILabel!
    @IBOutlet fileprivate weak var humidityLabel: UILabel!
    
    var weather: Weather? {
        didSet {
            cityLabel.text = "도시 이름 \(weather?.name ?? "")"
            statusLabel.text = "날씨 상태 \(weather?.weather[0].weatherDescription ?? "")"
            tempLabel.text = "기온 \(weather?.main.temp ?? 0)°C"
            windLabel.text = "풍속 \(weather?.wind.speed ?? 0)m/s"
            humidityLabel.text = "습도 \(weather?.main.humidity ?? 0)%"
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cityLabel.text = nil
        statusLabel.text = nil
        tempLabel.text = nil
        windLabel.text = nil
        humidityLabel.text = nil
    }
}
