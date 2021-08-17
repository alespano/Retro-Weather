// TodayWeatherView.swift

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var cityVM: CityViewViewModel
    
    
    var body: some View {
        VStack {
            LottieView(name: cityVM.getLottieAnimationFor(icon: cityVM.weatherIcon))
                .padding(.bottom, -20.0)
                .frame(width: 200, height: 200)
                .fixedSize(horizontal: true, vertical: true)
            Text(cityVM.city)
                .font(.custom("Minecraft", size: 12))
                .padding(.bottom, 8.0)
                .textCase(.uppercase)
                
                HStack(alignment: .center) {
                    Text(cityVM.conditions)
                    Text("\(cityVM.temperature)°")     
               }.font(.custom("Minecraft", size: 32))
                .padding(.bottom, 5.0)
            
            Text("Feels like \(cityVM.feelLike)°")
                .font(.custom("Minecraft", size: 12))
        }
        .padding(.bottom, 10.0)
        .foregroundColor(.white)
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
