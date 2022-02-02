//
//  AuthFirebaseLayer.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 30/01/2022.
//

import Foundation
import Firebase

protocol FirebaseAuth {
    func signIn(withEmail: String , password: String) async  -> (AuthDataResult?, Error?)
    func signUp(withEmail: String, password: String) async ->(AuthDataResult? , Error?)
}

class FirebaseAuthLayer: FirebaseAuth {
    
    func signIn(withEmail: String , password: String) async  -> (AuthDataResult?, Error?){
        return await withCheckedContinuation({ continuation in
            Auth.auth().signIn(withEmail: withEmail, password: password) { result, error in
                continuation.resume(returning: (result,error))
            }
        })
    }
    
    func signUp(withEmail: String, password: String) async ->(AuthDataResult? , Error?){
        return await withCheckedContinuation({ continuation in
            Auth.auth().createUser(withEmail: withEmail, password: password) { result, error in
                continuation.resume(returning: (result, error))
            }
        })
    }
    
}
