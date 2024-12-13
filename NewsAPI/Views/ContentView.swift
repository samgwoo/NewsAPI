//
//  ContentView.swift
//  NewsAPI
//
//  Created by Samuel Wu (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data = FetchData()
    
    var body: some View {
        ScrollView {
            ForEach(data.response.articles) {
                a in
                VStack (alignment: .leading, content:{
                    Text(a.title ?? " ")
                    Text(a.author ?? " ")
                    Text(a.url ?? " ")
                })
                .padding()
            }
        }

        .task {
            await data.getData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
