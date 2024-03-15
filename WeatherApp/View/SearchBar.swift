//
//  SerchBar.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isShowTF:Bool = false{
        didSet{
            text = ""
        }
    }
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass.circle")
                .imageScale(.large)
                .onTapGesture {
                    withAnimation {
                        self.isShowTF.toggle()
                    }
                }
            if isShowTF{
                TextField("", text: $text)
            }
            
        }
        .padding()
        .clipShape(.capsule)
        .overlay{
            Capsule().strokeBorder(.white ,lineWidth: 2)
        }
    }
}

#Preview {
    ContentView()
}
