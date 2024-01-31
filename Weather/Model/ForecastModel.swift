//
//  ForecastModel.swift
//  Weather
//
//  Created by Eli Dresnin (student LM) on 1/9/24.
//

import SwiftUI
struct Forecast: Codable{
    var message: Int = -9000
    var list: [DailyWeather] = []
}
struct DailyWeather: Codable {
    var visibility: Int = 0
    var main: Main = Main()
}


class ForecastModel: ObservableObject{
    
    @Published var forecast = Forecast()
    func loadData(latitude: Double = 40.0068, longitude: Double = -75.2855) async {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=5f9420cff4b1e5d648ad83b01bf36389"
        
        guard let url = URL(string: urlString) else {return}
        
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {return}
        
        guard let t = try? JSONDecoder().decode(Forecast.self, from: data) else {return}
        
        forecast = t
        
    }
}
