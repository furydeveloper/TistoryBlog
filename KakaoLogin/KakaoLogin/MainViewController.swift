//
//  MainViewController.swift
//  KakaoLogin
//
//  Created by Fury on 19/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private let mainLabel: UILabel = {
    let label = UILabel()
    label.text = "MainVC"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    layout()
  }
  
  private func layout() {
    view.addSubview(mainLabel)
    mainLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    mainLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
  }
}
