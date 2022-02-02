//
//  RegisterProtocols.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol! { get set }
    func showIndicatorWith(state: Bool)
    func stateOfRegisterValid(state: Bool)
}

protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
    var emailBehavior: BehaviorRelay<String> { get set}
    var passwordBehavior: BehaviorRelay<String> { get set }
    var re_PasswordBehavior: BehaviorRelay<String> { get set}
    var isLoadingBehavior: BehaviorRelay<Bool> { get set }
    
    func viewDidLoad()
    func dismissView()
    func createUser()
    func emailValid()-> Observable<Bool>
    func passwordValid()-> Observable<Bool>
    func re_PasswordVaild()-> Observable<Bool>
    func pasword_RePassword_IsValid_Car()-> Observable<Bool>
    func pasword_Is_Equal_RePassword()-> Observable<Bool>
    func isValidToCreateUser()-> Observable<Bool>
}

protocol RegisterRouterProtocol: AnyObject{
    func returnBackToLogin_From_Router()
}

protocol RegisterInPutInteractorProtocol: AnyObject{
    var presenter: RegisterOutputInteractorProtocol? { get set }
    func signIn(email: BehaviorRelay<String> , password: BehaviorRelay<String>) async
}

protocol RegisterOutputInteractorProtocol: AnyObject{
    func successUserRegister()
    func failUserRegister(_ error: Error)
}
