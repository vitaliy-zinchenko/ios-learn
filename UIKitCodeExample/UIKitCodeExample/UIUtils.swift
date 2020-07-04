//
//  UIUtils.swift
//  UIKitCodeExample
//
//  Created by Vitalii Zinchenko on 03.07.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func pintEdgesTo(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
    }
}

class UIUtils {
    static func pinEdgesTo(child: UIView, parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor)
        ])
    }
    
    static func center(child: UIView, parent: UIView) {
        centerH(child: child, parent: parent)
        centerV(child: child, parent: parent)
    }
    
    static func centerH(child: UIView, parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor)
        ])
    }
    
    static func centerV(child: UIView, parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerYAnchor.constraint(equalTo: parent.centerYAnchor)
        ])
    }
    
    static func marginT(child: UIView, parent: UIView, margin: CGFloat) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: margin)
        ])
    }
    
    static func margin(child: UIView, parent: UIView, top: CGFloat, trailing: CGFloat, bottom: CGFloat, leading: CGFloat) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: top),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -trailing),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -bottom),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: leading)
        ])
    }
    
    static func marginSafe(child: UIView, parent: UILayoutGuide, top: CGFloat, trailing: CGFloat, bottom: CGFloat, leading: CGFloat) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: top),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -trailing),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -bottom),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: leading)
        ])
    }

}
