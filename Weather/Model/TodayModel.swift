//
//  TodayModel.swift
//  Weather
//
//  Created by Eli Dresnin (student LM) on 1/9/24.
//

import SwiftUI

struct Today: Codable{
    var main: Main = Main()
}
struct Main: Codable{
    var temp: Double = 255.372
    var feels_like: Double = 255.372
    var temp_min: Double = 255.372
    var temp_max: Double = 255.372
    var humidity: Int = 0
}

class TodayModel: ObservableObject{
    
    @Published var today = Today()
    func loadData(latitude: Double = 40.0068, longitude: Double = -75.2855) async {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=5f9420cff4b1e5d648ad83b01bf36389"
        
        guard let url = URL(string: urlString) else {return}
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {return}
        guard let t = try? JSONDecoder().decode(Today.self, from: data) else {return}
        today = t
    }
}

