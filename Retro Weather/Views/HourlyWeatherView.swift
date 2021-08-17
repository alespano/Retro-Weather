// HourlyWeatherView.swift

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(cityVM.weather.hourly) { weather in
                    let icon = cityVM.getPixelIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityVM.getTimeFor(timestamp: weather.dt)
                    let temp = ("\(cityVM.getTempFor(temp: weather.temp))°")
                    getHourlyView(hour: hour, image: icon, temp: temp)
                    Rectangle()
                        .fill(.white)
                        .opacity(0.1)
                        .frame(width: 1.0, height: 50.0)
                        .edgesIgnoringSafeArea(.vertical)
                }
                
            }
            .padding(.leading, 10.0)
        }
        .padding(.bottom)
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 14) {
            Text(hour)
            image
                .foregroundColor(.white)
                .font(.system(size: 24))
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, 4.0)
            Text(temp)
        }
        .foregroundColor(.white)
        .padding()
        .font(.custom("Minecraft", size: 12))
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
