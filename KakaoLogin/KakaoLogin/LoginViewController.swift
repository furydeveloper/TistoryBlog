//
//  ViewController.swift
//  KakaoLogin
//
//  Created by Fury on 19/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("test", for: .normal)
    button.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    layout()
  }
  
  @objc private func touchUpLoginButton(_ sender: UIButton) {
    guard let session = KOSession.shared() else {
      return
    }
    
    if session.isOpen() {
      session.close()
    }
    
    KOSessionTask.userMeTask { (error, me) in
      print("nicname :", me?.nickname)
      print("email :", me?.account)
    }
    
    session.open(completionHandler: { (error) -> Void in
      
      if !session.isOpen() {
        if let error = error as NSError? {
          switch error.code {
          case Int(KOErrorCancelled.rawValue):
            break
          default:
            print("\(error.description)")
          }
        }
      }
    })
  }

  private func layout() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(loginButton)
    
    loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
    loginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
  }

}

