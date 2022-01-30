//
//  FirebaseWorker.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 30/01/2022.
//

import Foundation
import Firebase
import RxSwift
import RxCocoa


class FirebaseWorker{
    
    private let authLayer: FirebaseAuth!
    
    init(_ authlayer: FirebaseAuth = FirebaseAuthLayer()){
        self.authLayer = authlayer
    }
    
    func signIn(email: BehaviorRelay<String>, password: BehaviorRelay<String>) async ->(AuthDataResult? , Error?){
        return await authLayer.signIn(withEmail: email.value, password: password.value)
    }
    
    
}
