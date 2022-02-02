//
//  RegisterPresenter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import Foundation
import RxSwift
import RxCocoa

class RegisterPresenter: RegisterPresenterProtocol , RegisterOutputInteractorProtocol{
    
    
    var emailBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var passwordBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var re_PasswordBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoadingBehavior: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    
     //MARK: - Protocols
    weak var view: RegisterViewProtocol?
    private let router: RegisterRouterProtocol?
    private let interactor: RegisterInPutInteractorProtocol
    
    
     //MARK: - Init
    
    
    init(view: RegisterViewProtocol , router: RegisterRouterProtocol , interactor: RegisterInPutInteractorProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
     //MARK: - Helper Functions
    
    func viewDidLoad(){
        print("Register ViewDidLaod in Presenter !!!!")
    }
    
    func successUserRegister() {
        print("Succes To Create User")
    }
    
    
    func failUserRegister(_ error: Error) {
        print(error.localizedDescription)
    }
    
    
    func createUser(){
        Task {
            await interactor.signIn(email: emailBehavior, password: passwordBehavior)
        }
    }
    
     //MARK: - Help Validation
    
    
    func emailValid()-> Observable<Bool>{
        return emailBehavior.map { str in
            return str.count >= 8
        }
    }
    
    func passwordValid()-> Observable<Bool>{
        return passwordBehavior.map { str in
            return str.count >= 8
        }
    }
    
    func re_PasswordVaild()-> Observable<Bool>{
        return re_PasswordBehavior.map { str in
            return str.count >= 8
        }
    }
    
    
    func pasword_Is_Equal_RePassword()-> Observable<Bool>{
        return Observable.combineLatest(passwordValid(), re_PasswordVaild()).map { (pass, re_pass) in
            return pass && re_pass
        }
    }
    
    
    
    
    
}
