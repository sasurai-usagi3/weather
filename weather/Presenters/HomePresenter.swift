//
//  HomePresenter.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import UIKit
import RxSwift

class HomePresenter: NSObject {
    private let usecase: FetchWeatherUseCase
    private let formatter = DateFormatter()
    var forecasts: [WeatherForecast] = []
    
    init(usecase: FetchWeatherUseCase) {
        self.usecase = usecase
        
        formatter.dateFormat = "yyyy-MM-dd"
    }
    
    func fetch(area: Area) -> Single<WeatherInformation> {
        return self.usecase.fetch(area: area).observeOn(MainScheduler.instance)
    }
}

extension HomePresenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 80)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastListItem") as! WeatherForecastListItem
        let index = indexPath.row
        let forecast = forecasts[index]
        let imageUrl = URL(string: forecast.imageUrl)!
        let imageData = try? Data(contentsOf: imageUrl)
        
        cell.labelDate.text = formatter.string(from: forecast.date)
        cell.labelTelop.text = forecast.telop
        cell.imageViewOfTelop.image = imageData != nil ? UIImage(data: imageData!) : nil
        cell.labelMinTemperature.text = forecast.minTemperature != nil ? "最低気温: \(forecast.minTemperature!)℃" : "-"
        cell.labelMaxTemperature.text = forecast.maxTemperature != nil ? "最高気温: \(forecast.maxTemperature!)℃" : "-"
        
        return cell
    }
    
}
