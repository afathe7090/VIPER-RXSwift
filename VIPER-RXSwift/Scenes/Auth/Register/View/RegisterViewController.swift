//
//  RegisterViewController.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController , RegisterViewProtocol{
    
    
     //MARK: -  Protocols 
    var presenter: RegisterPresenterProtocol!
    
    private let bag = DisposeBag()
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Design
    //----------------------------------------------------------------------------------------------------------------
    
    private lazy var titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Hello"
        lbl.font = UIFont.boldSystemFont(ofSize: 35)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var registerTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Welcome to Register "
        lbl.font = UIFont.boldSystemFont(ofSize: 35)
        lbl.textColor = .white
        return lbl
    }()
    
    
     //MARK: - Title of TextField
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
    
    private lazy var titleOfRe_Pawword: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lbl.text = "RE_PASSWORD"
        lbl.tintColor = .white
        lbl.font = .titleLabelFont
        return lbl
    }()
    
    
    
    
    
     //MARK: -  textField UI
    
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
    
    private lazy var Re_PasswordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        txtField.rightView = showRe_PasswordButton
        txtField.rightViewMode = .always
        txtField.isSecureTextEntry = true
        txtField.font = UIFont.systemFont(ofSize: 20)
        return txtField
    }()
    
    
    
    
    
     //MARK: - View Line UI
    
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
    
    private lazy var lineRe_PasswordView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = .white
        return view
    }()
    
    
    
     //MARK: - StackVIew UI
    
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
    
    private lazy var stackForRe_Password: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleOfRe_Pawword, Re_PasswordTextField,lineRe_PasswordView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 0
        return stack
    }()
    
    
    
    
    
     //MARK: - Buttons UI
    
    private lazy var showPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(NSAttributedString(string: "SHOW", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.3092711568, green: 0.4988514185, blue: 0.7828478217, alpha: 1)
        return btn
    }()
    
    
    private lazy var showRe_PasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(NSAttributedString(string: "SHOW", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.3092711568, green: 0.4988514185, blue: 0.7828478217, alpha: 1)
        return btn
    }()
    
    
    private let registerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(NSAttributedString(string: "SignUp", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]), for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.layer.shadowColor = #colorLiteral(red: 0.3630462885, green: 0.6160885096, blue: 1, alpha: 1)
        btn.layer.shadowOffset = CGSize(width: 0, height: 10)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.7
        btn.backgroundColor = #colorLiteral(red: 0.3630462885, green: 0.6160885096, blue: 1, alpha: 1)
        return btn
    }()
    
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.setAttributedTitle(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)]), for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.yellow.cgColor
        return btn
    }()
    
    
    
    
    
    
    
     //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        
        presenter.viewDidLoad()
        setLayOut()
    }
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Auto Layout
    //----------------------------------------------------------------------------------------------------------------

    private func setLayOut(){
        setWelcomeLablwLayOut()
        setWelcomeRegisterLabelLayOut()
        setEmailTextField()
        setUserPassword()
        setUserRe_Password()
        setRegisterButtonLayout()
        setLoginButtonLayOut()
        
        
        setActionButton()
        setBinding()
    }
    
    private func setWelcomeLablwLayOut(){
        view.addSubview(titlelabel)
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setWelcomeRegisterLabelLayOut(){
        view.addSubview(registerTitleLabel)
        NSLayoutConstraint.activate([
            registerTitleLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 10),
            registerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func setEmailTextField(){
        view.addSubview(self.stackForUserName)
        NSLayoutConstraint.activate([
            stackForUserName.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 75),
            stackForUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForUserName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUserPassword() {
        view.addSubview(stackForPassword)
        NSLayoutConstraint.activate([
            stackForPassword.topAnchor.constraint(equalTo: stackForUserName.bottomAnchor, constant: 50),
            stackForPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setUserRe_Password(){
        view.addSubview(stackForRe_Password)
        NSLayoutConstraint.activate([
            stackForRe_Password.topAnchor.constraint(equalTo: stackForPassword.bottomAnchor, constant: 50),
            stackForRe_Password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForRe_Password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setRegisterButtonLayout()  {
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: stackForRe_Password.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    private func setLoginButtonLayOut(){
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
     //MARK: - Action Button
    
    
    private func setActionButton(){
        Task{
            await setBackLogin()
            await setShowPassword()
            await setShow_Re_password()
        }
    }
    
    
    private func setBackLogin() async {
        loginButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.presenter.dismissView()
        }).disposed(by: bag)
    }
    
    private func setShowPassword() async {
        showPasswordButton.rx.tap.subscribe(onNext: { _ in
            
        }).disposed(by: bag)
    }
    
    private func setShow_Re_password() async {
        showRe_PasswordButton.rx.tap.subscribe(onNext: { _ in
            
        }).disposed(by: bag)
    }
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Binding 
    //----------------------------------------------------------------------------------------------------------------
    
    private func setBinding(){
        Task{
            await setButtonRegisterIsValid()
            await emailBindingToPresenter()
        }
    }
    
    
    private func setButtonRegisterIsValid() async {
        presenter.isValidToCreateUser()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] state in
                
            guard let self = self else { return }
            self.registerButton.isEnabled = state
            self.registerButton.alpha = state ? 1:0.5
        }).disposed(by: bag)
    }
    
    
    private func emailBindingToPresenter() async {
        emailTextField.rx.text.orEmpty.bind(to: presenter.emailBehavior).disposed(by: bag)
        passwordTextField.rx.text.orEmpty.bind(to: presenter.passwordBehavior).disposed(by: bag)
        Re_PasswordTextField.rx.text.orEmpty.bind(to: presenter.re_PasswordBehavior).disposed(by: bag)
    }
    
    
    
}
