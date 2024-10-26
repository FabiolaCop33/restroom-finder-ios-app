//
//  RestroomClient.swift
//  RestroomFinder
//
//  Created by Fabiola Correa Padilla on 08/05/24.
//

import Foundation

struct RestroomClient{
    static let shared = RestroomClient()
    private init(){
        
    }
    private enum RestroomClientError: Error{
        case invalidResponse
        case decodingError(Error)
    }
    func fetchRestrooms(at url: URL) async throws -> [Restroom] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw RestroomClientError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Restroom].self, from: data)
        }catch {
            throw RestroomClientError.decodingError(error)
        }
        
    }
    
}
