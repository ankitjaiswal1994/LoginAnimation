//
//  LoginViewController.swift
//  Spare
//
//  Created by Pushpraj Chaudhary on 09/04/18.
//  Copyright © 2018 Ankit Jaiswal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    enum CellType: Int {
        case email
        case password
    }
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var touchIdButton: UIButton!
    @IBOutlet weak var signInButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswardButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fingerPrintTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpContainerView: UIView!
    @IBOutlet weak var fingerPrintImageView: UIImageView!
    
    var isAnimationCompleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let zPosition: CGFloat = 90
        let anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let transform = CATransform3DMakeRotation(90.degreesToRadians, 1.0, 0.0, 0.0)
        
        
        signInButton.layer.anchorPoint = anchorPoint
        signInButton.layer.zPosition = zPosition
        signInButton.layer.transform = transform
        
        forgotPasswardButton.layer.anchorPoint = anchorPoint
        forgotPasswardButton.layer.zPosition = zPosition
        forgotPasswardButton.layer.transform = transform

        signUpContainerView.layer.anchorPoint = anchorPoint
        signUpContainerView.layer.zPosition = zPosition
        signUpContainerView.layer.transform = transform

        fingerPrintImageView.alpha = 0
        
        logoImageView.transform = CGAffineTransform(scaleX: 20, y: 20).translatedBy(x: 0, y: 80)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isAnimationCompleted {
        animateLogo()
        }
    }
    
    //private animation methods
    private func animateLogo() {
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            self.logoImageView.transform = .identity
        }, completion: { (_) in
            self.isAnimationCompleted = true
            self.tableView.reloadData()
            self.animateButtons()
        })
    }
    
    private func animateButtons() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.signInButton.transform = .identity
        }, completion: { _ in
            self.animteFingerprint()
        })
        
        UIView.animate(withDuration: 2, delay: 0.8, usingSpringWithDamping: 0.2, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.forgotPasswardButton.transform = .identity
        }, completion: { _ in
        })

        UIView.animate(withDuration: 2, delay: 0.8, usingSpringWithDamping: 0.2, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.signUpContainerView.transform = .identity
        }, completion: { _ in
        })

    }
    
    private func animteFingerprint() {
        UIView.animate(withDuration: 0.5, animations: {
            self.fingerPrintImageView.alpha = 1
        }, completion: { _ in
        })
    }
    
    // TODO: NEED TO SET FROM STORYBOARD
    override func viewWillAppear(_ animated: Bool) {
       // navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    func saveSessionData() {
    }
    
    func navigationToDashboard(_ isAnimate: Bool = true) {
    }
    
    @IBAction func touchIdButtonAction(_ sender: UIButton) {
    }
    
}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let zPosition: CGFloat = 90
        let anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let transform = CATransform3DMakeRotation(90.degreesToRadians, 1.0, 0.0, 0.0)
        
        cell.layer.anchorPoint = anchorPoint
        cell.layer.zPosition = zPosition
        cell.layer.transform = transform

        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isAnimationCompleted ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")

        cell.textLabel?.text = "Hello animation" + String(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @objc func passwordToggle(_ sender: UIButton) {
    }
}

extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}
