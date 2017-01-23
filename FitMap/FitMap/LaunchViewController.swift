//
//  LaunchViewController.swift
//  FitMap
//
//  Created by Jhonny Bill Mena on 1/22/17.
//  Copyright © 2017 FormuladoresDiscretos. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    

    @IBOutlet weak var bottomC: NSLayoutConstraint!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    

    var user = User();
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        



        // Do any additional setup after loading the view.
//        doneButton.isHidden = true
//        nextButton.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func nextButton(_ sender: UIButton) {
        
//        self.dismiss(animated: true, completion: nil)
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "LaunchScreenStoryboard", bundle:nil)
//        let launchViewController = storyBoard.instantiateViewController(withIdentifier: "LaunchViewController") as! LaunchViewController
//        self.navigationController?.pushViewController(launchViewController, animated: true)
        
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetalleRuta", bundle:nil)
        let launchRutaViewController = storyBoard.instantiateViewController(withIdentifier: "LaunchViewController2") as! LaunchViewController
        
        self.present(launchRutaViewController, animated:true, completion:nil)
        
//            self.navigationController?.pushViewController(launchRutaViewController, animated: true)
        
//        self.dismiss(animated: true, completion: nil)
        
    }
    
    @available(iOS 10.0, *)
    @IBAction func registerButton(_ sender: UIButton) {
        
        //Capturing first and last name
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        
        user.User(id: 0, name: firstName, lastNam: lastName)
        
        //Send this user object to the UserSaving moddel
        let saving = UserSaving();
        saving.user(user: user)
        
        
        
        self.dismiss(animated: true, completion: nil)
        
        //        doneButton.isHidden = false
        //        nextButton.isHidden = true
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetalleRuta", bundle:nil)
        let detalleRutaViewController = storyBoard.instantiateViewController(withIdentifier: "DetalleRutaViewController") as! DetalleRutaViewController
        
        self.navigationController?.pushViewController(detalleRutaViewController, animated: true)
        
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.bottomC?.constant = 0.0
            } else {
                self.bottomC?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
    }

    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
