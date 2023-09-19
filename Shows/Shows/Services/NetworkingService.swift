//
//  NetworkingService.swift
//  Shows
//
//  Created by Matej Kuprešak on 19.09.2023..
//

import Foundation
import SwiftUI

protocol NetworkingServiceProtocol {
    func fetch(with request: Request, completion: @escaping (Result<[Show], ErrorHandler>) -> Void)
}

final class NetworkingService: ObservableObject, NetworkingServiceProtocol {
    func fetch(with request: Request, completion: @escaping (Result<[Show], ErrorHandler>) -> Void) {
        guard let urlRequest = configureRequest(request) else { return }
        let urlSession: URLSession = URLSession.shared
        
        //crete a data task
        urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 {
                if let data = data {
                    // parse data
                    do {
                        let json = try JSONDecoder().decode([SearchResponse].self, from: data)
                        let shows = json.map { $0.show }
                        print(json)
                        completion(.success(shows))
                    } catch {
                        print("Error: \(error)")
                        completion(.failure(.cannotParse))
                        return
                    }
                }
            } else {
                print("Error: \(httpResponse.statusCode)")
                completion(.failure(.notFound))
            }
        }
        .resume()
    }
}

extension NetworkingService {
    func configureRequest(_ request: Request) -> URLRequest? {
        let configuration: NetworkConfiguration = NetworkConfiguration(baseURL: "https://api.tvmaze.com")
        let urlString = configuration.baseURL + request.path
        
        guard let url = URL(string: urlString) else {
            print("Error creating request URL with: \(urlString)")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.setValue(request.type.rawValue, forHTTPHeaderField: "Content-Type")
        
        //headers
        if let headers = configuration.staticHeaders {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        //auth header
        if let authorization = configuration.authorizationHeaders {
            for (key, value) in authorization {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        //paramaters and query
        if let parameters = request.parameters {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
        
        if let query = request.query {
            urlRequest.url = URL(string: urlString.appending(query))
        }
        
        return urlRequest
    }
}
