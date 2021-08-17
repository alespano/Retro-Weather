// DailyWeatherView.swift

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
                //Divider().background(Color.white)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeather) -> some View {
        VStack {
            HStack(alignment: .center) {
                cityVM.getPixelIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    .font(.system(size: 24))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .fixedSize(horizontal: true, vertical: true)
                    .padding(.trailing, 12.0)
                
                VStack(alignment: .leading) {
                    Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                        .font(.custom("Minecraft", size: 12))
                        .multilineTextAlignment(.leading)
                        .offset(x: 0, y: 1)
                }
                Spacer()
                Text("\(cityVM.getTempFor(temp: weather.temp.max)) / \(cityVM.getTempFor(temp: weather.temp.min))")
                    .multilineTextAlignment(.trailing)
                    .font(.custom("Minecraft", size: 12))
                    .padding(.trailing, 32.0)
                    .offset(x: 0, y: 1)
            }
            Rectangle()
                .fill(.white)
                .padding(.leading, 44.0)
                .opacity(0.1)
                .frame(maxWidth: .infinity)
                .frame (height: 1)
                .edgesIgnoringSafeArea(.horizontal)
                .offset(x: 0, y: 8)
    }
        .foregroundColor(.white)
        .padding([.leading], 24.0)
        .frame(height: 48)
        .padding(/*@START_MENU_TOKEN@*/.vertical, 0.0/*@END_MENU_TOKEN@*/)
        
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
