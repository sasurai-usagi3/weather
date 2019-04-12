//
//  WeatherApiFetcherMock.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/12.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation
import RxSwift

class WeatherApiFetcherMock: WeatherApiFetcher {
    func fetch(areaCode: Int) -> Single<JsonWeather> {
        let dummyJsonWeatherPinpointLocations = [
            JsonWeather.JsonWeatherPinpointLocation(link: "http://dummy1.com", name: "恵比寿"),
            JsonWeather.JsonWeatherPinpointLocation(link: "http://dummy2.com", name: "目黒"),
            JsonWeather.JsonWeatherPinpointLocation(link: "http://dummy3.com", name: "五反田")
        ]
        let dummyJsonWeatherForecasets = [
            JsonWeather.JsonWeatherForecast(
                dateLabel: "今日",
                telop: "曇り",
                date: "2019-04-12",
                temperature: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature(
                    min: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature.JsonWeatherForecastTemperatureValues(celsius: "20", fahrenheit: "50"),
                    max: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature.JsonWeatherForecastTemperatureValues(celsius: "30", fahrenheit: "80")
                ),
                image: JsonWeather.JsonWeatherForecast.JsonWeatherForecastImage(width: 64, url: "http://dummyimage.com/64x64/ddd/fff", title: "曇り", height: 64)
            ),
            JsonWeather.JsonWeatherForecast(
                dateLabel: "明日",
                telop: "晴れのち雪",
                date: "2019-04-13",
                temperature: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature(
                    min: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature.JsonWeatherForecastTemperatureValues(celsius: "-4", fahrenheit: "20"),
                    max: nil
                ),
                image: JsonWeather.JsonWeatherForecast.JsonWeatherForecastImage(width: 64, url: "http://dummyimage.com/64x64/ddd/fff", title: "晴れのち雪", height: 64)
            ),
            JsonWeather.JsonWeatherForecast(
                dateLabel: "明日",
                telop: "雨時々雷",
                date: "2019-04-14",
                temperature: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature(
                    min: nil,
                    max: JsonWeather.JsonWeatherForecast.JsonWeatherForecastTemperature.JsonWeatherForecastTemperatureValues(celsius: "20", fahrenheit: "80")
                ),
                image: JsonWeather.JsonWeatherForecast.JsonWeatherForecastImage(width: 64, url: "http://dummyimage.com/64x64/ddd/fff", title: "雨時々雷", height: 64)
            )
        ]
        let dummyJsonWeatherLocation = JsonWeather.JsonWeatherLocation(city: "東京", area: "関東", prefecture: "東京都")
        let dummyJsonWeatherCopyright = JsonWeather.JsonWeatherCopyright(
            provider: [
                JsonWeather.JsonWeatherCopyright.JsonWeatherCopyrightProvider(link: "http://dummy.com", name: "株式会社テスト")
            ],
            link: "http://dummy.com",
            title: "株式会社ダミー",
            image: JsonWeather.JsonWeatherCopyright.JsonWeatherCopyrightImage(width: 64, url: "http://dummyimage.com/64x64/ddd/fff", link: "http://dummy.com", title: "ダミー", height: 64)
        )
        let dummyWeatherDescription = JsonWeather.JsonWeatherDescription(
            text: "本州付近は高気圧に覆われています。一方、伊豆諸島付近は気圧の谷とな っています。 東京地方は、おおむね曇りとなっています。 12日は、上空の気圧の谷や伊豆諸島付近で発生する低気圧の影響により 、曇りで夕方まで雨となる所があるでしょう。伊豆諸島では夜のはじめ頃ま で雨や雷雨となる所がある見込みです。 13日は、高気圧に覆われて晴れますが、湿った空気の影響で夜は曇りと なるでしょう。 【関東甲信地方】 関東甲信地方は曇りや晴れで、関東地方南部を中心に雨の降っている所が あります。 12日は、上空の気圧の谷や伊豆諸島付近で発生する低気圧の影響により 、曇りで雨や雷雨となる所がある見込みです。 13日は、高気圧に覆われて晴れるでしょう。 関東地方と伊豆諸島の海上では、12日から13日にかけて、うねりを伴 って波が高いでしょう。船舶は高波に注意してください",
            publicTime: "2019-04-12T10:55:00+0900"
        )
        let dummyJsonWeather = JsonWeather(
            pinpointLocations: dummyJsonWeatherPinpointLocations,
            link: "http://dummy-weather.com",
            forecasts: dummyJsonWeatherForecasets,
            location: dummyJsonWeatherLocation,
            publicTime: "2019-04-12T11:00:00+0900",
            copyright: dummyJsonWeatherCopyright,
            title: "東京都東京 今日の天気",
            description: dummyWeatherDescription
        )
        
        return Single.create { observer in
            observer(.success(dummyJsonWeather))
            
            return Disposables.create()
        }
    }
}
