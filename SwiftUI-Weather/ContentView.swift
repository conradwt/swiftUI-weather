//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Conrad Taylor on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
  
    var body: some View {
      ZStack {
        BackgroundView(isNight: $isNight)
        
        VStack {
          CityTextView(cityName: "Cupertino, CA")
          
          MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temperature: 76)
          
          HStack(spacing: 20) {
            WheatherDayView(dayOfWeek: "TUE",
                            imageName: "cloud.sun.fill",
                            temperature: 74)
            WheatherDayView(dayOfWeek: "WED",
                            imageName: "sun.max.fill",
                            temperature: 88)
            WheatherDayView(dayOfWeek: "THU",
                            imageName: "wind.snow",
                            temperature: 55)
            WheatherDayView(dayOfWeek: "FRI",
                            imageName: "sunset.fill",
                            temperature: 60)
            WheatherDayView(dayOfWeek: "SAT",
                            imageName: "snow",
                            temperature: 25)
          }
        
          Spacer()
          
          Button {
            isNight.toggle()
          } label: {
            WeatherButtom(title: "Change Day Time",
                          textColor: .blue,
                          backgroundColor: .white)
          }
          
          Spacer()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WheatherDayView: View {
  var dayOfWeek: String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
      
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      
      Text("\(temperature)°")
        .font(.system(size: 28, weight: .bold))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  @Binding var isNight: Bool

  var body: some View {
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
      
    }
    .padding(.bottom, 40)
  }
}
