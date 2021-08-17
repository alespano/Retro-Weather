// MenuHeaderView.swift

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "SEARCH"
    
    var body: some View {
        HStack {
            ZStack (alignment: .leading) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(.leading)
                    .font(.system(size: 12))
            }
            TextField("", text: $searchTerm)
                .padding(.top, 3.0)
                .padding(.leading, 12)
                .frame(height: 32.0)
                .foregroundColor(.white)
                .autocapitalization(.allCharacters)
                .font(.custom("Minecraft", size: 12))
            Button {
                cityVM.city = searchTerm
            } label: {
                ZStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 42, height: 42)
        }
        .foregroundColor(.white)
        .padding(2.0)
        .background(RoundedRectangle(cornerRadius: 16)
                        .fill(Color.black) .opacity(0.3))
        
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
