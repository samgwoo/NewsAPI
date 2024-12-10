//
//  ContentView.swift
//  NewsAPI
//
//  Created by Samuel Wu (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var jason = "Loading..."
    var body: some View {
        VStack {
            Text(jason)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=817b115a36d94ad6a20491a340aa5983")!

               let (data, _) = try! await URLSession.shared.data(from: url)

               jason = (String(decoding: data, as: UTF8.self))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
