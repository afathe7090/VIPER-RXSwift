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
    
    private let bag = DisposeBag()
    
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
    

    
 
     //MARK: - Observable Helper 
    
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
    
    
    func pasword_RePassword_IsValid_Car()-> Observable<Bool>{
        return Observable.combineLatest(passwordValid(), re_PasswordVaild()).map { (pass, re_pass) in
            return pass && re_pass
        }
    }
    
    func pasword_Is_Equal_RePassword()-> Observable<Bool> {
        return Observable.combineLatest(passwordBehavior, re_PasswordBehavior).map { (pass , repass) in
            return pass == repass
        }
    }
    
    func isValidToCreateUser()-> Observable<Bool> {
        return Observable.combineLatest(pasword_RePassword_IsValid_Car(), pasword_Is_Equal_RePassword()).map { (charValid, equalValid) in
            return charValid && equalValid
        }
    }
    

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  dismiss Register
    //----------------------------------------------------------------------------------------------------------------
    func dismissView(){
        router?.returnBackToLogin_From_Router()
    }
    
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -   Firebase Auth
    //----------------------------------------------------------------------------------------------------------------
    func createUser(){
        isValidToCreateUser().subscribe(onNext: { [weak self] state in
            guard let self = self else { return }
            self.isLoadingBehavior.accept(true)
            Task {
                await self.interactor.signIn(email: self.emailBehavior, password: self.passwordBehavior)
            }
        }).disposed(by: bag)
    }
    
    
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Valid Function With Actions
    //----------------------------------------------------------------------------------------------------------------
    private func bindingToSetUpIndicator(){
        isLoadingBehavior
            .observe(on: MainScheduler.instance).subscribe(onNext: {[weak self] state in
                guard let self = self else { return }
                self.view?.showIndicatorWith(state: state)
        }).disposed(by: bag)
    }
    
    
    private func changeStateOfRegisterButton(){
        isValidToCreateUser()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] state in
                
            guard let self = self else { return }
                self.view?.stateOfRegisterValid(state: state)
        }).disposed(by: bag)
    }
    
}

//----------------------------------------------------------------------------------------------------------------
//=======>MARK: -  Protocols Functiosn
//----------------------------------------------------------------------------------------------------------------
extension RegisterPresenter{
    //MARK: - Helper Functions
   
   func viewDidLoad(){
       bindingToSetUpIndicator()
       changeStateOfRegisterButton()
   }
   
   func successUserRegister() {
       isLoadingBehavior.accept(false)
       dismissView()
   }
   
   
   func failUserRegister(_ error: Error) {
       isLoadingBehavior.accept(false)
       print(error.localizedDescription)
   }
}
