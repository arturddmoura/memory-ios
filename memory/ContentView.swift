//
//  ContentView.swift
//  memory
//
//  Created by Artur Moura on 08/02/23.
//

import SwiftUI

    
struct ContentView: View {
    let emojis: [String] = ["📂", "♒️", "🚫", "📺", "💚", "🐺", "⚔", "🏘", "⛴", "📖"]
    @State var emojiCount: Int = 5
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0...emojiCount], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit).padding()
                    }
                }
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add

            }.font(.largeTitle).padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
            }, label: {Image(systemName: "minus.circle")})
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count - 1 {
                emojiCount += 1
            }
        }, label: {Image(systemName: "plus.circle")})
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape
                    .fill()
                Text(content)
                    .font(.largeTitle)
            } else {
                    shape
                        .fill()
                        .foregroundColor(.red)
                }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
