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
    
    var viewModel: WeatherViewModel? {
        didSet {
            cityLabel.text = viewModel?.cityName
            statusLabel.text = viewModel?.status
            tempLabel.text = viewModel?.temp
            windLabel.text = viewModel?.windSpped
            humidityLabel.text = viewModel?.humidity
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
