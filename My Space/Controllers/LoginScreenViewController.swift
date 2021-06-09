//
//  LoginScreenViewController.swift
//  My Space
//
//  Created by unthinkable-mac-0025 on 31/05/21.
//

import UIKit
import TransitionButton

class LoginScreenViewController: UIViewController {
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var emailBackground: UIView!
    @IBOutlet var passwordBackground: UIView!
    @IBOutlet var facebookIcon: UIButton!
    @IBOutlet var googleIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        facebookIcon.layer.cornerRadius = 20.0
        googleIcon.layer.cornerRadius = 20.0
        backgroundView.layer.cornerRadius = 20.0
        emailBackground.layer.cornerRadius = 20.0
        passwordBackground.layer.cornerRadius = 20.0
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
   
    @IBAction func loginBtnPressed(_ button: TransitionButton) {
        button.startAnimation() // start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {

            sleep(2) // Do your networking task or background work here.

            DispatchQueue.main.async(execute: { () -> Void in
                button.stopAnimation(animationStyle: .expand, completion: {
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController
                    self.navigationController?.pushViewController(vc, animated: true)
                })
            })
        })
    }
    
    
}


