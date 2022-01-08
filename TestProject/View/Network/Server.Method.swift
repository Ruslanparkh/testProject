//
//  Server.Method.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

//import Foundation
import Moya

extension Server {
    
    enum Method: TargetType {
        
        case searchImage(q: String)
        // MARK: - Configurations
        
        var baseURL: URL {
            return Server.getBaseURL()
        }
        
        var path: String {
            
        var target = "search.json"
            return target
        }

        var task: Task {
//            let apiKey = "8c8ee0d90e5cfa9aff6bc2282fc67ac68936d619502361142315407ecb64ba2c#"
//            var query = ""
//            let ijn = 9
//            let tbm = "isch"
            
            switch self {
                
            case let .searchImage(q):
                return Task.requestParameters(parameters: ["q": q, "tbm": "isch", "num": 20,
                                "api_key": "8c8ee0d90e5cfa9aff6bc2282fc67ac68936d619502361142315407ecb64ba2c"], encoding: URLEncoding.queryString)
            }
        }
        
        var method: Moya.Method {
                switch self {
                case .searchImage:
                    return .get
                }
            }
    
        var headers: [String: String]? { .none }
    
        var sampleData: Data {
            return Data()
        }
    }
}

