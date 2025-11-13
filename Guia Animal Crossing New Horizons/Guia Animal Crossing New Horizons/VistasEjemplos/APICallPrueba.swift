//
//  APICallPrueba.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 10/11/25.
//

import Foundation
import SwiftUI

class APICallPrueba {
    let baseURL: String = "https://api.nookipedia.com/"
    let headerKey: String = "X-API-KEY"
    let apiKey: String = "bc30978a-43a8-4df6-83f9-1acd0b8628bb"
    
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        modelServer: T.Type
    ) async throws -> T {
        let request = try buildRequest(endpoint: endpoint, method: method)
        
        let data = try await fetchData(request: request)
        
        let decodedData = try decodeData(data: data, modelServer: modelServer)
        return decodedData
    }
    
    private func buildRequest(
        endpoint: String,
        method: HTTPMethod
    ) throws -> URLRequest {
        guard let url = URL(string: baseURL + endpoint)
        else {
            throw APIError.badURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = [headerKey: apiKey]
        return urlRequest
    }
    
    private func fetchData(
        request: URLRequest
    ) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse
            else {
                throw APIError.noResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode)
            else {
                throw APIError.badResponse
            }
            
            return data
        } catch {
            throw APIError.serverError
        }
        
    }
    
    private func decodeData<T: Decodable>(
        data: Data,
        modelServer: T.Type
    ) throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(modelServer.self, from: data)
            return decodedData
        } catch {
            throw APIError.decode
        }
    }
}
