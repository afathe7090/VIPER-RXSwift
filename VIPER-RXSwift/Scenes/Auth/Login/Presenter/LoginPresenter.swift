//
//  LoginPresenter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 28/01/2022.
//

import Foundation
import RxCocoa
import RxSwift

class LoginPresenter: LoginPresernterProtocol, LoginOutputInteractorProtocol{
    
    
    //MARK: - Binding
    var emailBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var passwordBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoadingBehavior: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    //MARK: -  Data Protocol
    weak var view: LoginViewProtocol?
    private let interactor: LoginInputInteractorProtocol
    private let router: LoginRouterProtocol?
    
    
    //MARK: -  Init
    init(view: LoginViewProtocol, interactor: LoginInputInteractorProtocol, router: LoginRouterProtocol){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
     //MARK: - Helper functions
    func viewDidLoad() {
        print("In Presenter")
    }
    
    func signIn() {
        isLoadingBehavior.accept(true)
        Task{
            await interactor.signIn(email: self.emailBehavior, password: self.passwordBehavior)
        }
    }
    
    func succesfullSignIn() {
        isLoadingBehavior.accept(false)
        print("Succesfull Sign in")
    }
    
    func fetchSignInError(_ error: Error) {
        isLoadingBehavior.accept(false)
        print(error.localizedDescription)
    }
    
    func goToRegisterPage() {
        print("In presenter Login ")
        router?.goToRegisterPage()
    }
}
