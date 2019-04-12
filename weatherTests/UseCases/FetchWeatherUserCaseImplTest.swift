//
//  FetchWeatherUserCaseImplTest.swift
//  weatherTests
//
//  Created by 宇山拓夢 on 2019/04/12.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import XCTest
import RxTest
import RxBlocking

@testable import weather

class FetchWeatherUserCaseImplTest: XCTestCase {
    private lazy var testTarget: FetchWeatherUseCase = {
        let mockedWeatherApiFetcher = WeatherApiFetcherMock()
        
        return FetchWeatherUseCaseImpl(fetcher: mockedWeatherApiFetcher)
    }()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetch() {
        let actual = try! testTarget.fetch(area: Area.TOKYO).toBlocking().single()
        let formatter1 = ISO8601DateFormatter()
        let formatter2 = DateFormatter()
        
        formatter2.dateFormat = "yyyy-MM-dd"
        
        XCTAssertEqual(actual, WeatherInformation(
            location: "東京都東京",
            publishedAt: formatter1.date(from: "2019-04-12T11:00:00+0900")!,
            forecasts: [
                WeatherForecast(date: formatter2.date(from: "2019-04-12")!, telop: "曇り", imageUrl: "https://dummyimage.com/50x31/ddd/fff", minTemperature: 20, maxTemperature: 30),
                WeatherForecast(date: formatter2.date(from: "2019-04-13")!, telop: "晴れのち雪", imageUrl: "https://dummyimage.com/50x31/ddd/fff", minTemperature: -4, maxTemperature: nil),
                WeatherForecast(date: formatter2.date(from: "2019-04-14")!, telop: "雨時々雷", imageUrl: "https://dummyimage.com/50x31/ddd/fff", minTemperature: nil, maxTemperature: 20)
            ]
        ))
    }

}

extension WeatherInformation: Equatable {
    public static func == (lhs: WeatherInformation, rhs: WeatherInformation) -> Bool {
        return lhs.location == rhs.location && lhs.publishedAt == rhs.publishedAt && lhs.forecasts == rhs.forecasts
    }
}

extension WeatherForecast: Equatable {
    public static func == (lhs: WeatherForecast, rhs: WeatherForecast) -> Bool {
        return lhs.date == rhs.date && lhs.telop == rhs.telop && lhs.minTemperature == rhs.minTemperature && lhs.maxTemperature == rhs.maxTemperature
    }
}
