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
    
     //MARK: - Helper Functions
    
    func viewDidLoad(){
        print("Register ViewDidLaod in Presenter !!!!")
        bindingToSetUpIndicator()
        changeStateOfRegisterButton()
    }
    
    func successUserRegister() {
        print("Succes To Create User")
    }
    
    
    func failUserRegister(_ error: Error) {
        print(error.localizedDescription)
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
    
     //MARK: - Actions Func
    
    func dismissView(){
        router?.returnBackToLogin_From_Router()
    }
    
    func createUser(){
        isValidToCreateUser().subscribe(onNext: { [weak self] state in
            guard let self = self else { return }
            Task {
                await self.interactor.signIn(email: self.emailBehavior, password: self.passwordBehavior)
            }
        }).disposed(by: bag)
    }
    
    
    
    
    
    
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
