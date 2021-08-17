import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    CityView(cityVM: cityVM)
                }.padding(.top, 10)
                Rectangle()
                    .fill(.white)
                    .frame(height: 1.0)
                    .opacity(0.05)
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.horizontal)
                MenuHeaderView(cityVM: cityVM).padding([.top, .leading, .trailing]).padding(/*@START_MENU_TOKEN@*/.bottom, 40.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, keyboard.currentHeight)
                            .edgesIgnoringSafeArea(.bottom)
                            .animation(.easeOut(duration: 0.16))
            }.padding(.top, 40)
        }.background(Color(red: 23 / 255, green: 17 / 255, blue: 32 / 255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
