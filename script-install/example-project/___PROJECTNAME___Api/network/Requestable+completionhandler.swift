////
////  Requestable+completionhandler.swift
////  CFApi
////
////  Created by Håkon Bogen on 17/08/2018,33.
////  Copyright © 2018 Beining & Bogen. All rights reserved.
////
//
//import Foundation
//import ReactiveSwift
//import ReactiveCocoa
//
//extension Requestable {
//
//    internal static func requestData(serverConfig: ServerConfigType, path: Path, parameters: Parameter?, sessionConfig: URLSessionConfiguration? = nil, completionHandler: @escaping (Result<Data, RequestableError>) -> ()) {
//
//        let auth: [String: String]? = serverConfig.basicHTTPAuth?.authorizationHeader
//        var urlComponents = URLComponents(string: serverConfig.baseURL.absoluteString)!
//        do {
//            if let baseUrl = urlComponents.url {
//                let encoder = JSONEncoder()
//                encoder.dataEncodingStrategy = dataEncodingStrategy
//                encoder.dateEncodingStrategy = dateEncodingStrategy
//                if let query = path.pathComponents.query {
//                    let decoded = try JSONSerialization.jsonObject(with: encoder.encode(query), options: [])
//                    guard let dictionary = decoded as? [String: Any] else {
//                        throw EncodingError.invalidValue(decoded, .init(codingPath: [], debugDescription: "Expected to decode Dictionary<String, _> but found a Dictionary<_, _> instead"))
//                    }
//                    urlComponents.queryItems = dictionary.map { URLQueryItem(name: $0, value: String(describing: $1)) }
//                }
//
//                let url = path.pathComponents.path.reduce(baseUrl, { $0.appendingPathComponent($1) })
//                var request = URLRequest(url: url)
//                request.httpMethod = method.rawValue
//                request.httpBody = try parameters.map(encoder.encode)
//                mainHeaders
//                    .merging(auth ?? [:], uniquingKeysWith: { $1 })
//                    .forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
//                let task = URLSession(configuration: sessionConfig ?? self.sessionConfig).dataTask(with: request) { data, response, error in
//                    debugPrintYAML(request: request, response: response, received: data, error: error.map(RequestableError.underlying))
//                    switch (data, response, error) {
//                    case (_, _, let error?):
//
//                        completionHandler(Result.failure(.underlying(error: error)))
//
//                    case (let data?, let response as HTTPURLResponse, _):
//                        if 200...299 ~= response.statusCode {
//                            completionHandler(Result.success(data))
//                        } else {
//                            //                                       observer.send(error: .statusCode(code: response.statusCode, response: response, data: data))
//                        }
//                    case (let data?, _, _):
//                        break
//                        //                                    observer.send(value: data)
//                    //                                    observer.sendCompleted()
//                    default:
//                        break
//                        //                                    observer.sendCompleted()
//                    }
//                }
//                //                            lifetime.observeEnded(task.cancel)
//                task.resume()
//            } else {
//                //                            observer.send(error: .invalidUrl(components: urlComponents))
//            }
//        } catch let error as EncodingError {
//            //                        observer.send(error: .encoding(error: error))
//        } catch {
//            //                        observer.send(error: .underlying(error: error))
//        }
//    }
//    //        fatalError()
//}
//extension Requestable where Response: Decodable {
//    internal static func decode(data: Data) -> Result<Response, RequestableError> {
//        let decoder = JSONDecoder()
//        do {
//            decoder.dataDecodingStrategy = dataDecodingStrategy
//            decoder.dateDecodingStrategy = dateDecodingStrategy
//            return .success(try decoder.decode(Response.self, from: data))
//        } catch {
//            return .failure(.decoding(error: error as! DecodingError, data: data))
//        }
//    }
//}
//extension Requestable where Response == Data {
//
//    static func request(serverConfig: ServerConfigType, path: Path, parameters: Parameter, sessionConfig: URLSessionConfiguration? = nil, completionHandler: @escaping (Result<Response, RequestableError>) -> ()) {
//        return requestData(serverConfig: serverConfig, path: path, parameters: parameters, sessionConfig: sessionConfig, completionHandler: completionHandler)
//    }
//
//}
////
//extension Requestable where Response == Data, Parameter == Never {
//    //
//    static func request(serverConfig: ServerConfigType, path: Path, sessionConfig: URLSessionConfiguration? = nil, completionHandler: @escaping (Result<Response, RequestableError>) -> ()) {
//        return requestData(serverConfig: serverConfig, path: path, parameters: nil, sessionConfig: sessionConfig, completionHandler: completionHandler)
//    }
//}
//
//extension Requestable where Response: Decodable {
//
//    static func request(serverConfig: ServerConfigType, path: Path, parameters: Parameter, sessionConfig: URLSessionConfiguration? = nil, completionHandler: @escaping (Result<Response, RequestableError>) -> ()) {
//
//        requestData(serverConfig: serverConfig, path: path, parameters: parameters, sessionConfig: sessionConfig) { response in
//            switch response {
//            case .success(let value ):
//                let result = decode(data: value)
//                switch result {
//                case .success(let val):
//                    completionHandler(Result.success(val))
//                case .failure(let error):
//                    completionHandler(Result.failure(error))
//                }
//            case .failure(let error ):
//                completionHandler(Result.failure(error))
//            }
//        }
//
//    }
//}
//public static func request(serverConfig: ServerConfigType, path: Path, parameters: Parameter, sessionConfig: URLSessionConfiguration? = nil) -> SignalProducer<Response, RequestableError> {
//    return requestData(serverConfig: serverConfig, path: path, parameters: parameters, sessionConfig: sessionConfig)
//        .attemptMap(decode(data:))
//}
//}
//
//extension Requestable where Response: Decodable, Parameter == Never {
//
//    static func request(serverConfig: ServerConfigType, path: Path, sessionConfig: URLSessionConfiguration? = nil, completionHandler: @escaping (Result<Response, RequestableError>) -> ()) {
//
//        requestData(serverConfig: serverConfig, path: path, parameters: nil, sessionConfig: sessionConfig) { response in
//            switch response {
//            case .success(let value ):
//                let result = decode(data: value)
//                switch result {
//                case .success(let val):
//                    completionHandler(Result.success(val))
//                case .failure(let error):
//                    completionHandler(Result.failure(error))
//                }
//            case .failure(let error ):
//                completionHandler(Result.failure(error))
//            }
//
//        }
//        public static func request(serverConfig: ServerConfigType, path: Path, sessionConfig: URLSessionConfiguration? = nil) -> SignalProducer<Response, RequestableError> {
//            return requestData(serverConfig: serverConfig, path: path, parameters: nil, sessionConfig: sessionConfig)
//                .attemptMap(decode(data:))
//
//}
//extension Requestable where Response: Decodable {
//    internal static func decode(data: Data) -> Result<Response, RequestableError> {
//        let decoder = JSONDecoder()
//        do {
//            decoder.dataDecodingStrategy = dataDecodingStrategy
//            decoder.dateDecodingStrategy = dateDecodingStrategy
//            return .success(try decoder.decode(Response.self, from: data))
//        } catch {
//            return .failure(.decoding(error: error as! DecodingError, data: data))
//        }
//    }
//}
