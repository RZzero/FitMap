//
//  DetailsReviewViewController.swift
//  FitMap
//
//  Created by fitmap on 1/6/17.
//  Copyright © 2017 FormuladoresDiscretos. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailsReviewViewController: UIViewController {

    
    @IBOutlet weak var FirstViewContainer: UIView!
    
    @IBOutlet weak var SecondViewContainer: UIView!
    
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        
        tabBarController?.tabBar.barTintColor = UIColor.black
        tabBarController?.tabBar.tintColor = UIColor.red
        
        // Do any additional setup after loading the view.
        
        FirstViewContainer.isHidden = false
        SecondViewContainer.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //Switching between views (first = details; second = review)
    
    
    @IBAction func ChangeView(_ sender: UISegmentedControl) {
        
        switch SegmentedControl.selectedSegmentIndex {
        case 0:
            FirstViewContainer.isHidden = false
            SecondViewContainer.isHidden = true
            break
            
        default:
            FirstViewContainer.isHidden = true
            SecondViewContainer.isHidden = false
            
        }
        
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
