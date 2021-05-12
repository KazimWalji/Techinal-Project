//
//  ViewController.swift
//  TechincalProject
//
//  Created by Kazim Walji on 5/10/21.
//

import UIKit
class HomeVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var imageView = UIImageView()
    let cancel = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        
        let uploadLabel = UILabel()
        uploadLabel.backgroundColor = .clear
        uploadLabel.textAlignment = .left
        uploadLabel.font = UIFont(name: "DamascusSemiBold", size: 30)
        uploadLabel.textColor = .black
        setTextWithLineSpacing(label: uploadLabel, text: "Upload a picture of \nyour drivers license", lineSpacing: 10)
        uploadLabel.numberOfLines = 0
        self.view.addSubview(uploadLabel)
        uploadLabel.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraints = [uploadLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180),
                                uploadLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                                uploadLabel.widthAnchor.constraint(equalToConstant: 300),
                                uploadLabel.heightAnchor.constraint(equalToConstant: 80)]
        NSLayoutConstraint.activate(labelConstraints)
        
        let uploadButton = UIButton()
        uploadButton.backgroundColor = .black
        uploadButton.layer.cornerRadius = 30
        uploadButton.setTitleColor(UIColor.white, for: .normal)
        uploadButton.setTitle("Upload", for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadPhoto), for: UIControl.Event.touchDown)
        self.view.addSubview(uploadButton)
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonConstraints = [uploadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                 uploadButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70),
                                 uploadButton.widthAnchor.constraint(equalToConstant: 300),
                                 uploadButton.heightAnchor.constraint(equalToConstant: 60)]
        NSLayoutConstraint.activate(buttonConstraints)
        
        let invisibleView = UIView()
        self.view.addSubview(invisibleView)
        invisibleView.translatesAutoresizingMaskIntoConstraints = false
        let invisibleConstraints = [invisibleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    invisibleView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -60),
                                    invisibleView.topAnchor.constraint(equalTo: uploadLabel.bottomAnchor, constant: 30),
                                    invisibleView.bottomAnchor.constraint(equalTo: uploadButton.topAnchor, constant: -30)]
        NSLayoutConstraint.activate(invisibleConstraints)
        
        
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1
        imageView.backgroundColor =  UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        imageView.layer.borderColor = CGColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        let imageViewConstraints = [imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -60),
                                    imageView.centerYAnchor.constraint(equalTo: invisibleView.centerYAnchor),
                                    imageView.heightAnchor.constraint(equalToConstant: 200)]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        cancel.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        cancel.tintColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        cancel.alpha = 0
        
        self.view.addSubview(cancel)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.addTarget(self, action: #selector(deleteImg(sender:)), for: .touchDown)
        let cancelConstraints = [cancel.widthAnchor.constraint(equalToConstant: 35), cancel.heightAnchor.constraint(equalToConstant: 35), cancel.centerXAnchor.constraint(equalTo: imageView.trailingAnchor), cancel.centerYAnchor.constraint(equalTo: imageView.topAnchor)]
        NSLayoutConstraint.activate(cancelConstraints)
    }
    
    
    @objc func deleteImg(sender: UIButton!) {
        cancel.alpha = 0
        imageView.image = nil
    }
    
    @objc func uploadPhoto() {
        if imageView.image == nil {
            let picker = UIImagePickerController()
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (alertAction) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    picker.sourceType = .camera
                    picker.allowsEditing = true
                    picker.delegate = self
                    self.present(picker, animated: true)
                }
            }))
            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alertAction) in
                picker.sourceType = .photoLibrary
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated: true)
            }))
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            cancelAction.setValue(UIColor.systemRed, forKey: "titleTextColor")
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        } else {
            User.shared.licenseImage = imageView.image
            let nextVC = ConfirmDetailsVC()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image = UIImage()
        if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            image = img
        } else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            image = img
        }
        
        dismiss(animated: true)
        
        imageView.image = image
        cancel.alpha = 1
    }
    
    func setTextWithLineSpacing(label:UILabel,text:String,lineSpacing:CGFloat) //Took this from StackOverflow in order to edit spacing between lines in a UILabel
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        label.attributedText = attrString
    }
}

