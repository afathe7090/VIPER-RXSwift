//
//  HomePresenter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import Foundation
import RxSwift
import RxCocoa


class HomePresenter: HomePresenterProtocol , HomeOutputInteractorProtocol{
    
    
    
     //MARK: - Protocols
    weak var view: HomeViewProtocol?
    private let interactor: HomeInputInteractorProtocol?
    private let router: HomeRouterProtocol?
    
    
    
     //MARK: - Init
    init(view: HomeViewProtocol, interactor: HomeInputInteractorProtocol, router: HomeRouterProtocol){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
     //MARK: - ViewDidLoad
    
    func viewDidLoad(){
        print("In View DiDLaod Presnter")
        fetchNews()
    }
    
     //MARK: - Api States
    
    
    private func fetchNews(){
        Task{
            await interactor?.fetchNews()
        }
    }
    
    
    func successFetchNews(_ news: News) {
        
    }
    
    func failToFetchNews() {
        
    }
    
    
    func configureCell(cell: NewsCell, indexPath: IndexPath){
        
    }
    
    
    
    
    
    
    
}
