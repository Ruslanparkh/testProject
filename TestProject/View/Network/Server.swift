//
//  Server.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

import Foundation

final class Server {
    private init() {}
    
    static func getBaseURL() -> URL {
        return URL(string: "https://serpapi.com/")!
    }
}
