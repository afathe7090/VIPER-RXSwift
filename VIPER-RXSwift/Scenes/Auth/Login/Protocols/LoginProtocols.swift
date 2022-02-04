//
//  LoginProtocols.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 28/01/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresernterProtocol! {get set}
    func showIndectorView(state: Bool)
    func changeStateOFLoginButton(state: Bool)
    
}

protocol LoginPresernterProtocol: AnyObject{
    var view: LoginViewProtocol? {get set}
    var emailBehavior: BehaviorRelay<String> { get set }
    var passwordBehavior: BehaviorRelay<String> { get set }
    var isLoadingBehavior: BehaviorRelay<Bool> {get set}
    
    func viewDidLoad()
    func signIn()
    
    func goToRegisterVC_In_Presenter()
}

protocol LoginRouterProtocol: AnyObject{
    func goToRegisterVC_In_Router()
    func startToGoHomePage_In_Router()
}


protocol LoginInputInteractorProtocol: AnyObject{
    var presenter: LoginOutputInteractorProtocol? {get set}
    func signIn(email: BehaviorRelay<String> , password: BehaviorRelay<String>) async
    
}

protocol LoginOutputInteractorProtocol: AnyObject{
    func succesfullSignIn()
    func fetchSignInError(_ error : Error)
}
