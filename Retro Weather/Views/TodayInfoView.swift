// TodayWeatherView.swift

import SwiftUI

struct TodayInfoView: View {
    @ObservedObject var cityVM: CityViewViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
                Text("MORE INFO")
                    .font(.custom("Minecraft", size: 12))
                Spacer()
                widgetView(image: "wind", color: .green, title: "\(cityVM.windSpeed)mi/hr")
                Spacer()
                widgetView(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .red, title: "\(cityVM.rainChances)")
                Spacer()
            } .padding()
            .foregroundColor(.white)
        }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
            Text(title)
        }
    }
}

struct TodayInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            
            
    }
}
