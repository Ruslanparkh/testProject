//
//  Server.Error.swift
//  TestProject
//
//  Created by Руслан Пархомюк on 22.12.2021.
//

import Foundation

extension Server {
    
    struct Error: Swift.Error {
        
        let reason: Reason
        
        let suspenseTime: TimeInterval?
        
        // MARK: - Life Cycle
        
        init(_ reason: Reason, suspenseTime: TimeInterval? = nil) {
            self.reason = reason
            self.suspenseTime = suspenseTime
        }
        
    }
    
}
