//
//  MeViewController.swift
//  FitMap
//
//  Created by fitmap on 12/14/16.
//  Copyright © 2016 FormuladoresDiscretos. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        
        tabBarController?.tabBar.barTintColor = UIColor.black
        tabBarController?.tabBar.tintColor = UIColor.red
        
        func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
