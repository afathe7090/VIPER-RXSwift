//
//  ApiWorker.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 04/02/2022.
//

import Foundation


class ApiWorker{
    
    private let ApiSerivice: ApiServicesType
    
    
    init(apiSercices: ApiServicesType = ApiServices()){
        self.ApiSerivice = apiSercices
    }
    
    func fetchNews(url: URL) async -> News?{
        return await ApiSerivice.requestServireWith(News.self, url: url)
    }
    
    
    
    
}
