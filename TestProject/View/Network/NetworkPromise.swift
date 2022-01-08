//
//  NetworkPromise.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

//import Foundation

import Moya

final class NetworkPromise<T: Decodable> {
    
    private let serverMethod: Server.Method
    private var executingRequest: Cancellable?
    
    // MARK: - Life Cycle
    
    init(_ serverMethod: Server.Method) {
        self.serverMethod = serverMethod
        start()
    }
    
    // MARK: - Final Actions
    
    private var checkAction: (T) -> Bool = { _ in true }
    
    private var thenAction: (T) -> Void = { _ in }
    
    @discardableResult func then(_ action: @escaping (T) -> Void) -> NetworkPromise<T> {
        thenAction = action
        return self
    }
    
    private var catchAction: (Server.Error) -> Void = { _ in }
    
    @discardableResult func `catch`(_ action: @escaping (Server.Error) -> Void) -> NetworkPromise<T> {
        catchAction = action
        return self
    }
    
    // MARK: - Public Properties
    
    private(set) var isRunning = false
    
    // MARK: - Public Functions
    
    func start() {
        cancel()
        
        isRunning = true
        executingRequest = NetworkHelper.instance.request(serverMethod, with: self)
    }
    
    func finish(_ response: T) {
        isRunning = false
        
        guard checkAction(response) else {
            let error = Server.Error(.connectionFailure)
            catchAction(error)
            
            return
        }
        
        thenAction(response)
    }
    
    func finish(_ error: Server.Error) {
        isRunning = false
        catchAction(error)
    }
    
    func cancel() {
        executingRequest?.cancel()
        isRunning = false
    }
}
