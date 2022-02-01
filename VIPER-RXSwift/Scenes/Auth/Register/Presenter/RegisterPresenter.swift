//
//  RegisterPresenter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import Foundation

class RegisterPresenter: RegisterPresenterProtocol , RegisterOutputInteractorProtocol{
    
    weak var view: RegisterViewProtocol?
    private let router: RegisterRouterProtocol?
    private let interactor: RegisterInPutInteractorProtocol
    
    
    
    init(view: RegisterViewProtocol , router: RegisterRouterProtocol , interactor: RegisterInPutInteractorProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidLoad(){
        print("Register ViewDidLaod in Presenter !!!!")
    }
    
   
}
