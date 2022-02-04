//
//  APiNetworking.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 04/02/2022.
//

import Foundation
import UIKit


// Protocol Of Type Appi
protocol ApiServicesType {
    func requestServireWith<ResponceModel: Codable>(_ model: ResponceModel.Type ,url: URL) async ->  ResponceModel?
}

// Error Typee With Connect To The Server
enum ServireError: Error {
    case ErrorWithConnectToServier
}


// Api Services With Modern Concurncy
class ApiServices: ApiServicesType{
        
    func requestServireWith<ResponceModel: Codable>(_ model: ResponceModel.Type ,url: URL) async ->  ResponceModel?{
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            return try? JSONDecoder().decode(model.self, from: data)
        }catch{
            print(error.localizedDescription)
            return nil
        }
        
    }
}


// Helper Extension For handel api Data
extension URLSession {
    
    func data(from url: URL) async throws -> (Data,URLResponse) {
        return try await withCheckedThrowingContinuation({ continuation in
            URLSession.shared.dataTask(with: url) { (data, responce, error) in
                guard
                    let data = data ,
                    let responce = responce
                else {
                    continuation.resume(throwing: ServireError.ErrorWithConnectToServier)
                    return
                }
                continuation.resume(returning: (data , responce))
                return
            }
            .resume()
        })
    }
}



