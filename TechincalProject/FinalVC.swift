//
//  FinalVC.swift
//  TechincalProject
//
//  Created by Kazim Walji on 5/11/21.
//

import UIKit

class FinalVC: UIViewController, UITextFieldDelegate {

    let licenseNoField = TextField()
    let birthdayField = TextField()
    let firstName = TextField()
    let lastName = TextField()
    let textFieldView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        textFieldView.clipsToBounds = false
        self.view.addSubview(textFieldView)
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        let viewConstraints = [textFieldView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                           textFieldView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                           textFieldView.topAnchor.constraint(equalTo: self.view.topAnchor),
                           textFieldView.heightAnchor.constraint(equalTo: self.view.heightAnchor)]
        NSLayoutConstraint.activate(viewConstraints)
        
        let dismissButton = UIButton()
        dismissButton.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        dismissButton.tintColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
       dismissButton.addTarget(self, action: #selector(dismissView(sender:)), for: UIControl.Event.touchDown)
        textFieldView.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        let dismissConstraints = [dismissButton.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 70), dismissButton.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 30), dismissButton.widthAnchor.constraint(equalToConstant: 40), dismissButton.heightAnchor.constraint(equalToConstant: 40)]
        NSLayoutConstraint.activate(dismissConstraints)
        
        let verifyButton = UIButton()
        verifyButton.backgroundColor = .black
        verifyButton.layer.cornerRadius = 30
        verifyButton.setTitleColor(UIColor.white, for: .normal)
        verifyButton.setTitle("Upload", for: .normal)
        verifyButton.addTarget(self, action: #selector(verify), for: UIControl.Event.touchDown)
        textFieldView.addSubview(verifyButton)
        verifyButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonConstraints = [verifyButton.centerXAnchor.constraint(equalTo: textFieldView.centerXAnchor),
                           verifyButton.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -70),
                           verifyButton.widthAnchor.constraint(equalToConstant: 300),
                           verifyButton.heightAnchor.constraint(equalToConstant: 60)]
        NSLayoutConstraint.activate(buttonConstraints)
        
        let imageView = UIImageView()
        imageView.image = User.shared.licenseImage
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1
        imageView.backgroundColor =  UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        imageView.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        let imageViewConstraints = [imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -60),
                                    imageView.bottomAnchor.constraint(equalTo: verifyButton.topAnchor, constant: -30),
                                    imageView.heightAnchor.constraint(equalToConstant: 200)]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        licenseNoField.backgroundColor = .white
        licenseNoField.layer.borderWidth = 1
        licenseNoField.layer.cornerRadius = 10
        licenseNoField.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        licenseNoField.keyboardType = .numberPad
        licenseNoField.delegate = self
        licenseNoField.textColor = .black
        licenseNoField.leftViewMode = .always
        licenseNoField.text = User.shared.licenseNo
        licenseNoField.isUserInteractionEnabled = false
        textFieldView.addSubview(licenseNoField)
        licenseNoField.translatesAutoresizingMaskIntoConstraints = false
        let licenseNoConstraints = [licenseNoField.centerXAnchor.constraint(equalTo: textFieldView.centerXAnchor),
                                    licenseNoField.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -30),
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
        birthdayField.text = User.shared.dob
        textFieldView.addSubview(birthdayField)
        birthdayField.isUserInteractionEnabled = false
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
        
        lastName.backgroundColor = .white
        lastName.layer.borderWidth = 1
        lastName.layer.cornerRadius = 10
        lastName.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        lastName.keyboardType = .alphabet
        lastName.delegate = self
        lastName.textColor = .black
        lastName.leftViewMode = .always
        lastName.text = User.shared.lastName
        lastName.isUserInteractionEnabled = false
        textFieldView.addSubview(lastName)
        lastName.translatesAutoresizingMaskIntoConstraints = false
        let lastNameConstraints = [lastName.trailingAnchor.constraint(equalTo: birthdayField.trailingAnchor),
                                    lastName.bottomAnchor.constraint(equalTo: birthdayField.topAnchor, constant: -30),
                                    lastName.leadingAnchor.constraint(equalTo: birthdayField.leadingAnchor, constant: 0),
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
        
        firstName.backgroundColor = .white
        firstName.layer.borderWidth = 1
        firstName.layer.cornerRadius = 10
        firstName.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        firstName.keyboardType = .alphabet
        firstName.delegate = self
        firstName.textColor = .black
        firstName.leftViewMode = .always
        firstName.text = User.shared.firstName
        firstName.isUserInteractionEnabled = false
        textFieldView.addSubview(firstName)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        let firstNameConstraints = [firstName.leadingAnchor.constraint(equalTo: birthdayField.leadingAnchor),
                                    firstName.bottomAnchor.constraint(equalTo: lastName.topAnchor, constant: -30),
                                    firstName.trailingAnchor.constraint(equalTo: birthdayField.trailingAnchor, constant: 0),
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
            let alert = UIAlertController(title: "Congrats!", message: "Your Application was submitted", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                User.shared = User()
                let home = HomeVC()
                home.modalPresentationStyle = .fullScreen
                self.present(home, animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                print("OK")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
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
