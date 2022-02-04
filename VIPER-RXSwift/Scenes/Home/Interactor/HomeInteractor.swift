//
//  HomeInteractor.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import Foundation
import RxCocoa
import RxSwift


class HomeInteractor: HomeInputInteractorProtocol {
    var presenter: HomeOutputInteractorProtocol?
    
    
    
    private var apiWorker: ApiWorker {
        return ApiWorker()
    }
    
    func fetchNews() async {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=f0b310a6e5f349838307ddd53bfa66c0&country=AR") else { return }
        let news  = await apiWorker.fetchNews(url: url)

        if let news = news {
            // Success
            print(news)
            presenter?.successFetchNews(news)
        }else{
            // Fail
            print("Error In Interactor")
            presenter?.failToFetchNews()
        }
        
    }
    
}
