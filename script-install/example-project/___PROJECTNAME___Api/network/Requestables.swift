//
//  Requestables.swift
//  Chesterfield
//
//  Created by Håkon Bogen on 30/06/2018,26.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import Foundation




public struct Requests {
    
public enum GetQuestions: Requestable {
    
    public typealias Parameter = Never
    public typealias Response = [Question]
    
    public struct Path: PathComponentsProvider {
        
        public typealias Query = Never

        public init() {
            
        }
        
        public var pathComponents: (path: [String], query: Query?) {
            return (
                ["json"],
                nil
            )
        }
    }
    
//    public static let apiType: APIType = .standard
    public static let method: HTTPMethod = .get
    
}
    
    public enum GetSubjectRequestable: Requestable {
        public typealias Parameter = Never
        public typealias Response = Subject
        
        public struct Path: PathComponentsProvider {
            
            public typealias Query = Never
            
            public init() {
                
            }
            
            public var pathComponents: (path: [String], query: Never?) {
                // TODO kan deles opp:
                return (["themes/Jakt&Våpen"], nil)
            }
        }
        
        public static let method: HTTPMethod = .get
    }

}
