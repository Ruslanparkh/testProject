//
//  NetworkHelper.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

//import Foundation
import Moya
import Darwin

final class NetworkHelper {
    
    static let instance = NetworkHelper()
    
    private let serverProvider: MoyaProvider<Server.Method> = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 25
        
        let session = Session(configuration: configuration)
        return MoyaProvider<Server.Method>(session: session)
    } ()
    
    private init() {}
    
    //MARK: - Available Requests
    
    func searchImage(q: String) -> NetworkPromise<ImageData>{
        let method = Server.Method.searchImage(q: q)
        return NetworkPromise(method)
    }
    
    
    // MARK: - Public Functions
    
    func request<T: Decodable>(_ method: Server.Method, with promise: NetworkPromise<T>) -> Cancellable {
        return serverProvider.request(method) { response in
            let responseHandler = Server.ResponseHandler(response)
            responseHandler.handle(method, with: promise)
        }
    
    }
    
}

