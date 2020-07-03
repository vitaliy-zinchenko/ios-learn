//
//  ViewController.swift
//  UIKitCodeExample4
//
//  Created by Vitalii Zinchenko on 01.07.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//

import UIKit

class FirstScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = FirstView(nextDidTap: nextDidTap)
    }
    
    @objc func nextDidTap() {
        print("next touch up inside")
        let secondScreen = SeconndScreen()
        navigationController?.pushViewController(secondScreen, animated: true)
    }

}

class FirstView: UIView {
    
    var nextDidTap: (() -> Void)?
    
    init(nextDidTap: @escaping () -> Void) {
        super.init(frame: .zero)
        self.nextDidTap = nextDidTap
        
        backgroundColor = .red
        
        let card = createCard()
        addSubview(card)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: centerYAnchor),
            card.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCard() -> UIView {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .blue
        let nextButton = createNextButton()
        card.addSubview(nextButton)
        
        // Button constrains
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            nextButton.centerXAnchor.constraint(equalTo: card.centerXAnchor)
        ])

        // Card constrains
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.widthAnchor.constraint(equalToConstant: 100),
            card.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        return card
    }
    
    func createNextButton() -> UIButton {
        let btn = UIButton()
        btn.setTitle("Next >>", for: .normal)
        btn.addTarget(self, action: #selector(nextAction), for:.touchUpInside)
        
        return btn
    }
    
    @objc func nextAction() {
        self.nextDidTap?()
    }
    
}
