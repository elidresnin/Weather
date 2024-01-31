//
//  ContentView.swift
//  Weather
//
//  Created by Eli Dresnin (student LM) on 1/9/24.
//

import SwiftUI

enum ViewState{
    case today, forecast
}
struct ContentView: View {
    @State var viewState: ViewState = .today
    var body: some View {
        VStack {
            if viewState == .today {
                TodayView()
            }
            else if viewState == .forecast {
                ForecastView()
            }
           
            Spacer()
            HStack{
                Spacer()
                Button{
                    viewState = .today
                }label: {
                    VStack{
                        Image(systemName: "gear")
                        Text("today")
                    }
                }
                Spacer()
               
                Spacer()
                Button{
                    viewState = .forecast
                }label: {
                    VStack{
                        Image(systemName: "person")
                           
                        Text("forecast")
                    }
                }
                Spacer()
           
            }
            .padding([.horizontal, .top], 10.0)
            .padding(.bottom, 0.0)
            .edgesIgnoringSafeArea(.vertical)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
    }
}
