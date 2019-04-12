//
//  HomePresenterTest.swift
//  weatherTests
//
//  Created by 宇山拓夢 on 2019/04/12.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import XCTest
import RxTest
import RxBlocking

@testable import weather

class HomePresenterTest: XCTestCase {
    private lazy var testTarget: HomePresenter = {
        let mockedFetchWeatherUseCase = FetchWeatherUseCaseMock()
        
        return HomePresenter(usecase: mockedFetchWeatherUseCase)
    }()
    
    func testFetch() {
        let actual = try! testTarget.fetch(area: Area.TOKYO).toBlocking().single()
        let formatter1 = ISO8601DateFormatter()
        let formatter2 = DateFormatter()
        
        formatter2.dateFormat = "yyyy-MM-dd"
        
        XCTAssertEqual(actual, WeatherInformation(
            location: "東京都東京",
            publishedAt: formatter1.date(from: "2019-04-12T11:00:00+0900")!,
            forecasts: [
                WeatherForecast(date: formatter2.date(from: "2019-04-12")!, telop: "曇り", minTemperature: 20, maxTemperature: 30),
                WeatherForecast(date: formatter2.date(from: "2019-04-13")!, telop: "晴れのち雪", minTemperature: -4, maxTemperature: nil),
                WeatherForecast(date: formatter2.date(from: "2019-04-14")!, telop: "雨時々雷", minTemperature: nil, maxTemperature: 20)
            ]
        ))
    }
}
