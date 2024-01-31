//
//  TodayView.swift
//  Weather
//
//  Created by Eli Dresnin (student LM) on 1/9/24.
//

import SwiftUI

struct TodayView: View {
    @StateObject var todayModel: TodayModel = TodayModel()
    @EnvironmentObject var user: User
    var body: some View {
        VStack{
            Spacer()
            Text("\(Int(todayModel.today.main.temp * 1.8 + -459.67))°")
                .font(.custom("Helvetica", size: 140))
            HStack{
                Text("Feels like: \(Int((todayModel.today.main.feels_like-273.15) * 1.8 + 32))°")
                    .font(.custom("Helvetica", size: 48))
            }
            Spacer()
            HStack{
                Text("Low Temperature")
                    .font(.custom("Helvetica", size: 18))
                Spacer()
                Text("\(Int((todayModel.today.main.temp_min-273.15) * 1.8 + 32))°")
                    .font(.custom("Helvetica", size: 36))
            }.padding()
            HStack{
                Text("High Temperature")
                    .font(.custom("Helvetica", size: 18))
                Spacer()
                Text("\(Int((todayModel.today.main.temp_max-273.15) * 1.8 + 32))°")
                    .font(.custom("Helvetica", size: 36))
            }.padding()
            HStack{
                Text("Humidity")
                    .font(.custom("Helvetica", size: 18))
                Spacer()
                Text("\(Int(todayModel.today.main.humidity))%")
                    .font(.custom("Helvetica", size: 36))
            }.padding()
            Spacer()
        }.task {
            await todayModel.loadData(latitude: user.latitude, longitude: user.longitude)
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .environmentObject(User())
    }
}
