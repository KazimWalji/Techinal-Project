//
//  ViewController.swift
//  TechincalProject
//
//  Created by Kazim Walji on 5/10/21.
//

import UIKit

class ConfirmDetailsVC: UIViewController, UITextFieldDelegate {
    
    let licenseNoField = TextField()
    let birthdayField = TextField()
    let firstName = TextField()
    let lastName = TextField()
    let textFieldView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        
        
        let confirmLabel = UILabel()
        confirmLabel.backgroundColor = .clear
        confirmLabel.textAlignment = .left
        confirmLabel.font = UIFont(name: "DamascusSemiBold", size: 30)
        confirmLabel.textColor = .black
        setTextWithLineSpacing(label: confirmLabel, text: "Confirm personal\ndetails", lineSpacing: 10)
        confirmLabel.numberOfLines = 0
        self.view.addSubview(confirmLabel)
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraints = [confirmLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180),
                                confirmLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                                confirmLabel.widthAnchor.constraint(equalToConstant: 300),
                                confirmLabel.heightAnchor.constraint(equalToConstant: 80)]
        NSLayoutConstraint.activate(labelConstraints)
        
        textFieldView.clipsToBounds = false
        self.view.addSubview(textFieldView)
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        let viewConstraints = [textFieldView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                               textFieldView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                               textFieldView.topAnchor.constraint(equalTo: self.view.topAnchor),
                               textFieldView.heightAnchor.constraint(equalTo: self.view.heightAnchor)]
        NSLayoutConstraint.activate(viewConstraints)
        
        let verifyButton = UIButton()
        verifyButton.backgroundColor = .black
        verifyButton.layer.cornerRadius = 30
        verifyButton.setTitleColor(UIColor.white, for: .normal)
        verifyButton.setTitle("Verify", for: .normal)
        verifyButton.addTarget(self, action: #selector(verify), for: UIControl.Event.touchDown)
        textFieldView.addSubview(verifyButton)
        verifyButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonConstraints = [verifyButton.centerXAnchor.constraint(equalTo: textFieldView.centerXAnchor),
                                 verifyButton.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -70),
                                 verifyButton.widthAnchor.constraint(equalToConstant: 300),
                                 verifyButton.heightAnchor.constraint(equalToConstant: 60)]
        NSLayoutConstraint.activate(buttonConstraints)
        
        let dismissButton = UIButton()
        dismissButton.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        dismissButton.tintColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        dismissButton.addTarget(self, action: #selector(dismissView(sender:)), for: UIControl.Event.touchDown)
        textFieldView.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        let dismissConstraints = [dismissButton.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 70), dismissButton.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 30), dismissButton.widthAnchor.constraint(equalToConstant: 40), dismissButton.heightAnchor.constraint(equalToConstant: 40)]
        NSLayoutConstraint.activate(dismissConstraints)
        
        licenseNoField.backgroundColor = .white
        licenseNoField.layer.borderWidth = 1
        licenseNoField.layer.cornerRadius = 10
        licenseNoField.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        licenseNoField.keyboardType = .numberPad
        licenseNoField.delegate = self
        licenseNoField.textColor = .black
        licenseNoField.leftViewMode = .always
        textFieldView.addSubview(licenseNoField)
        licenseNoField.translatesAutoresizingMaskIntoConstraints = false
        let licenseNoConstraints = [licenseNoField.centerXAnchor.constraint(equalTo: textFieldView.centerXAnchor),
                                    licenseNoField.bottomAnchor.constraint(equalTo: verifyButton.topAnchor, constant: -50),
                                    licenseNoField.widthAnchor.constraint(equalTo: verifyButton.widthAnchor),
                                    licenseNoField.heightAnchor.constraint(equalTo: verifyButton.heightAnchor)]
        NSLayoutConstraint.activate(licenseNoConstraints)
        
        let licenseText = UILabel()
        licenseText.text = "Drivers License Number"
        licenseText.textColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        licenseText.font = UIFont(name: "Arial", size: 12)
        licenseNoField.addSubview(licenseText)
        licenseText.translatesAutoresizingMaskIntoConstraints = false
        let licenseTextConstraints = [licenseText.centerXAnchor.constraint(equalTo: licenseNoField.centerXAnchor),
                                      licenseText.topAnchor.constraint(equalTo:licenseNoField.topAnchor, constant: 5),
                                      licenseText.widthAnchor.constraint(equalTo: licenseNoField.widthAnchor, constant: -50),
                                      licenseText.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(licenseTextConstraints)
        
        birthdayField.backgroundColor = .white
        birthdayField.layer.borderWidth = 1
        birthdayField.layer.cornerRadius = 10
        birthdayField.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        birthdayField.keyboardType = .numbersAndPunctuation
        birthdayField.delegate = self
        birthdayField.textColor = .black
        birthdayField.leftViewMode = .always
        textFieldView.addSubview(birthdayField)
        birthdayField.translatesAutoresizingMaskIntoConstraints = false
        let birthdayConstraints = [birthdayField.centerXAnchor.constraint(equalTo: textFieldView.centerXAnchor),
                                   birthdayField.bottomAnchor.constraint(equalTo: licenseNoField.topAnchor, constant: -30),
                                   birthdayField.widthAnchor.constraint(equalTo: verifyButton.widthAnchor),
                                   birthdayField.heightAnchor.constraint(equalTo: verifyButton.heightAnchor)]
        NSLayoutConstraint.activate(birthdayConstraints)
        
        let birthdayText = UILabel()
        birthdayText.text = "Birthday"
        birthdayText.textColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        birthdayText.font = UIFont(name: "Arial", size: 12)
        birthdayField.addSubview(birthdayText)
        birthdayText.translatesAutoresizingMaskIntoConstraints = false
        let birthdayTextConstraints = [birthdayText.centerXAnchor.constraint(equalTo: birthdayField.centerXAnchor),
                                       birthdayText.topAnchor.constraint(equalTo:birthdayField.topAnchor, constant: 5),
                                       birthdayText.widthAnchor.constraint(equalTo: birthdayField.widthAnchor, constant: -50),
                                       birthdayText.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(birthdayTextConstraints)
        
        firstName.backgroundColor = .white
        firstName.layer.borderWidth = 1
        firstName.layer.cornerRadius = 10
        firstName.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        firstName.keyboardType = .alphabet
        firstName.delegate = self
        firstName.textColor = .black
        firstName.leftViewMode = .always
        textFieldView.addSubview(firstName)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        let firstNameConstraints = [firstName.leadingAnchor.constraint(equalTo: birthdayField.leadingAnchor),
                                    firstName.bottomAnchor.constraint(equalTo: birthdayField.topAnchor, constant: -30),
                                    firstName.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -10),
                                    firstName.heightAnchor.constraint(equalTo: verifyButton.heightAnchor)]
        NSLayoutConstraint.activate(firstNameConstraints)
        
        let firstNameText = UILabel()
        firstNameText.text = "First Name"
        firstNameText.textColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        firstNameText.font = UIFont(name: "Arial", size: 12)
        firstName.addSubview(firstNameText)
        firstNameText.translatesAutoresizingMaskIntoConstraints = false
        let firstNameTextConstraints = [firstNameText.centerXAnchor.constraint(equalTo: firstName.centerXAnchor),
                                        firstNameText.topAnchor.constraint(equalTo:firstName.topAnchor, constant: 5),
                                        firstNameText.widthAnchor.constraint(equalTo: firstName.widthAnchor, constant: -50),
                                        firstNameText.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(firstNameTextConstraints)
        
        lastName.backgroundColor = .white
        lastName.layer.borderWidth = 1
        lastName.layer.cornerRadius = 10
        lastName.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        lastName.keyboardType = .alphabet
        lastName.delegate = self
        lastName.textColor = .black
        lastName.leftViewMode = .always
        textFieldView.addSubview(lastName)
        lastName.translatesAutoresizingMaskIntoConstraints = false
        let lastNameConstraints = [lastName.trailingAnchor.constraint(equalTo: birthdayField.trailingAnchor),
                                   lastName.bottomAnchor.constraint(equalTo: birthdayField.topAnchor, constant: -30),
                                   lastName.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
                                   lastName.heightAnchor.constraint(equalTo: verifyButton.heightAnchor)]
        NSLayoutConstraint.activate(lastNameConstraints)
        
        let lastNameText = UILabel()
        lastNameText.text = "Last Name"
        lastNameText.textColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        lastNameText.font = UIFont(name: "Arial", size: 12)
        lastName.addSubview(lastNameText)
        lastNameText.translatesAutoresizingMaskIntoConstraints = false
        let lastNameTextConstraints = [lastNameText.centerXAnchor.constraint(equalTo: lastName.centerXAnchor),
                                       lastNameText.topAnchor.constraint(equalTo:lastName.topAnchor, constant: 5),
                                       lastNameText.widthAnchor.constraint(equalTo: lastName.widthAnchor, constant: -50),
                                       lastNameText.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(lastNameTextConstraints)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification,object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func dismissView(sender:UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func verify() {
        if lastName.text?.count ?? 0 > 2 && firstName.text?.count ?? 0 > 2 && birthdayField.text?.count ?? 0 > 6 && licenseNoField.text?.count ?? 0 > 8 {
            User.shared.lastName = lastName.text!
            User.shared.firstName = firstName.text!
            User.shared.licenseNo = licenseNoField.text!
            User.shared.dob = birthdayField.text!
            let final = FinalVC()
            final.modalPresentationStyle = .fullScreen
            self.present(final, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                print("OK")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -270
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func setTextWithLineSpacing(label:UILabel,text:String,lineSpacing:CGFloat) //Took this from StackOverflow in order to edit spacing between lines
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        label.attributedText = attrString
    }
    
}

class TextField: UITextField { //Textifeld text starts at the bottom with a small indentation
    
    let padding = UIEdgeInsets(top: 20, left: 25, bottom: 0, right: 0)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
