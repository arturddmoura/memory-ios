//
//  ContentView.swift
//  memory
//
//  Created by Artur Moura on 08/02/23.
//

import SwiftUI

struct ContentView: View {
    let emoji: [String] = ["📂", "♒️", "🚫", "📺", "💚", "🐺", "⚔", "🏘", "⛴", "📖"]
    
    var body: some View {
        VStack {
            ForEach(emoji, id: \.self) {emoji in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 3)
                    Text(emoji)
                }.padding()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
