//
//  ForecastView.swift
//  Weather
//
//  Created by Eli Dresnin (student LM) on 1/9/24.
//

import SwiftUI

struct ForecastView: View {
    @StateObject var forecastModel = ForecastModel()
    @EnvironmentObject var user: User
    var body: some View {
        Text("\(forecastModel.forecast.message)")
            .task {
                await forecastModel.loadData(latitude: user.latitude, longitude: user.longitude)
            }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .environmentObject(User())
    }
}
