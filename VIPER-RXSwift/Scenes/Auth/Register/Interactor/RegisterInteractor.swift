//
//  RegisterInteractor.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import Foundation
import RxCocoa
import RxSwift

class RegisterInteractor: RegisterInPutInteractorProtocol{
    
    weak var presenter: RegisterOutputInteractorProtocol?
    
    private let firebaseWorker = FirebaseWorker()
    
    init(){}
    
    
    func signIn(email: BehaviorRelay<String> , password: BehaviorRelay<String>) async {
       let (_ , error)  = await firebaseWorker.signUp(email: email, password: password)
        
        if let error = error {
            presenter?.failUserRegister(error)
        }else{
            presenter?.successUserRegister()
        }
    }
    
    
    
}
