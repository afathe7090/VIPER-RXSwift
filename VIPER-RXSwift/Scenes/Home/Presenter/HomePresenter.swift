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
    
    weak var view: HomeViewProtocol?
    private let interactor: HomeInputInteractorProtocol?
    private let router: HomeRouterProtocol?
    
    
    init(view: HomeViewProtocol, interactor: HomeInputInteractorProtocol, router: HomeRouterProtocol){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}
