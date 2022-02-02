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
}

protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
    func viewDidLoad()
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
