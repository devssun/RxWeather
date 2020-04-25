//
//  ViewController.swift
//  RxWeather
//
//  Created by 최혜선 on 2020/04/24.
//  Copyright © 2020 jamie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var searchBar: UISearchBar!
    @IBOutlet fileprivate weak var tableView: UITableView!

    var disposeBag = DisposeBag()
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        searchBar.rx.text
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { input in
                if let input = input, input.count > 2 {
                    APIHelper().getCurrentWeatherData(cityName: input) { (weather) in
                        self.weather = weather
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherTableViewCell {
            cell.weather = weather
            return cell
        }
        fatalError("cell error")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
