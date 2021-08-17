// CityView.swift

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack {
            TodayWeatherView(cityVM: cityVM)
                .padding(.vertical, 10.0)
            HourlyWeatherView(cityVM: cityVM)
            DailyWeatherView(cityVM: cityVM)
            TodayInfoView(cityVM: cityVM)
        }.padding(.bottom, 30).padding(/*@START_MENU_TOKEN@*/.top, -8.0/*@END_MENU_TOKEN@*/)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
