//
//  LoginViewController.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 28/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, LoginViewProtocol {
    
    //MARK: - Presenter
    
    var presenter: LoginPresernterProtocol!
    
    //MARK: - Bag
    
    private let bag = DisposeBag()
    
    
    //MARK: - Design
    private lazy var TitleOfHelloLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Hello."
        lbl.font = UIFont.boldSystemFont(ofSize: 42)
        return lbl
    }()
    private lazy var TitleOfWelcomeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Welcome Back"
        lbl.font = UIFont.boldSystemFont(ofSize: 42)
        return lbl
    }()
    private lazy var stackOfTitle: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [TitleOfHelloLabel, TitleOfWelcomeLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var titleOfUserName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lbl.text = "USERNAME"
        lbl.tintColor = .white
        lbl.font = .titleLabelFont
        return lbl
    }()
    private lazy var titleOfPawword: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lbl.text = "PASSWORD"
        lbl.tintColor = .white
        lbl.font = .titleLabelFont
        return lbl
    }()
    
    private lazy var emailTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        txtField.font = UIFont.systemFont(ofSize: 20)
        txtField.autocapitalizationType = .none
        return txtField
    }()
    private lazy var passwordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        txtField.rightView = showPasswordButton
        txtField.rightViewMode = .always
        txtField.isSecureTextEntry = true
        txtField.font = UIFont.systemFont(ofSize: 20)
        return txtField
    }()
    
    private lazy var showPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(NSAttributedString(string: "SHOW", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.3092711568, green: 0.4988514185, blue: 0.7828478217, alpha: 1)
        return btn
    }()
    
    private lazy var lineUserNameView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = .white
        return view
    }()
    private lazy var linePasswordView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var stackForUserName: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleOfUserName, emailTextField, lineUserNameView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 0
        return stack
    }()
    private lazy var stackForPassword: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleOfPawword, passwordTextField,linePasswordView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 0
        return stack
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(NSAttributedString(string: "LOGIN", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]), for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.layer.shadowColor = #colorLiteral(red: 0.3630462885, green: 0.6160885096, blue: 1, alpha: 1)
        btn.layer.shadowOffset = CGSize(width: 0, height: 10)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.7
        btn.backgroundColor = #colorLiteral(red: 0.3630462885, green: 0.6160885096, blue: 1, alpha: 1)
        return btn
    }()
    
    
    private lazy var registerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.setAttributedTitle(NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]), for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.yellow.cgColor
        return btn
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        TaskLayOut()
        setBindingTextField()
    }
    
    
    
    //MARK: - setLayOut
    
    private func TaskLayOut(){
        setTitleLabelView()
        setUserNameField()
        setUserPassword()
        setSignInLayout()
        setRegisterButtonLayout()
    }
    
    
    private func setTitleLabelView()  {
        view.addSubview(stackOfTitle)
        NSLayoutConstraint.activate([
            stackOfTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackOfTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackOfTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setUserNameField() {
        view.addSubview(self.stackForUserName)
        NSLayoutConstraint.activate([
            stackForUserName.topAnchor.constraint(equalTo: stackOfTitle.bottomAnchor, constant: 75),
            stackForUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForUserName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setUserPassword()  {
        view.addSubview(stackForPassword)
        NSLayoutConstraint.activate([
            stackForPassword.topAnchor.constraint(equalTo: stackForUserName.bottomAnchor, constant: 50),
            stackForPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setSignInLayout()  {
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: stackForPassword.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    private func setRegisterButtonLayout(){
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
     //MARK: - binding
    
    func setBindingTextField(){
        Task{
            await TextFiledBindingToPresenter()
            await signInButtonPressed()
            await setRegisterButtonAction()
        }
    }
    
    func TextFiledBindingToPresenter() async {
        emailTextField.rx.text.orEmpty.bind(to: presenter.emailBehavior).disposed(by: bag)
        passwordTextField.rx.text.orEmpty.bind(to: presenter.passwordBehavior).disposed(by: bag)
    }
    
    func signInButtonPressed() async {
        loginButton.rx.tap.subscribe({[weak self ] _ in
            guard let self = self else{ return }
            self.presenter.signIn()
        }).disposed(by: bag)
    }
    
    
     //MARK: - Indicator
    
    
    func showIndectorView(state: Bool){
        state ? Hud.showHud(in: view):Hud.dismiss()
    }
    
    func changeStateOFLoginButton(state: Bool){
        loginButton.isEnabled = state
        loginButton.alpha = state ? 1:0.5
    }
    
    func setRegisterButtonAction() async {
        registerButton.rx.tap.subscribe(onNext: { _ in
            print(#function)
            self.presenter.goToRegisterVC_In_Presenter()
        }).disposed(by: bag)
    }
    
}
