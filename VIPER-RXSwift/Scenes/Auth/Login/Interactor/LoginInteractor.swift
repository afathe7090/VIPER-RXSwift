//
//  LoginInteractor.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 28/01/2022.
//

import Foundation
import RxCocoa
import RxSwift

class LoginInteractor: LoginInputInteractorProtocol {
    
    weak var presenter: LoginOutputInteractorProtocol?
    
    private let firebaseWorker = FirebaseWorker()
    
    
    func signIn(email: BehaviorRelay<String> , password: BehaviorRelay<String>) async{
        guard email.value.count  >= 8 ,
              password.value.count >= 8 else{ return }
        let (_ ,error) =  await firebaseWorker.signIn(email: email, password: password)
        if let error = error {
            presenter?.fetchSignInError(error)
        }else{
            presenter?.succesfullSignIn()
        }
        
    }
    
    
    
}
