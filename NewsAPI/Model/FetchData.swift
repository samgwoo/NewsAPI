//
//  FetchData.swift
//  NewsAPI
//
//  Created by Samuel Wu (student LM) on 12/12/24.
//

import Foundation


struct FetchData {
    
    var response: Response = Response()
    
    mutating func getData() async {
        let URLString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=817b115a36d94ad6a20491a340aa5983"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data,_) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable {
    var status: String = " "
    var totalResults: Int = 0
    var articles: [Article] = []
}
struct Article: Codable {
    var title: String?
    var author: String?
    var url: String?
}

extension Article: Identifiable {
    var id:String {title ?? " "}
}
