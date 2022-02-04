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
   
    private let bag = DisposeBag()
    
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
        
        Task {
            await startBindingForIndectator()
            await changeStateForUI()
        }
        
    }
    
    func signIn() {
        isLoadingBehavior.accept(true)
        Task{
            await interactor.signIn(email: self.emailBehavior, password: self.passwordBehavior)
        }
    }
    
    func succesfullSignIn() {
        DispatchQueue.main.async {
            self.isLoadingBehavior.accept(false)
            self.router?.startToGoHomePage_In_Router()
        }
    }
    
    func fetchSignInError(_ error: Error) {
        isLoadingBehavior.accept(false)
        print(error.localizedDescription)
    }
    
    func goToRegisterVC_In_Presenter() {
        print("In presenter Login ")
        router?.goToRegisterVC_In_Router()
    }
    
    func startBindingForIndectator() async {
        isLoadingBehavior
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self ] state in
            guard let self = self else { return }
            self.view?.showIndectorView(state: state)
        }).disposed(by: bag)
    }
    
    
    func changeStateForUI() async{
        Observable.combineLatest(emailBehavior, passwordBehavior).map { (email,pass) in
            return email.count >= 8 && pass.count >= 8
        }.observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
            guard let self = self else{ return }
            self.view?.changeStateOFLoginButton(state: state)
        }).disposed(by: bag)
    }
    
}
