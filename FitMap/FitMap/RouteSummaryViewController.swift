//
//  RouteSummaryViewController.swift
//  FitMap
//
//  Created by fitmap on 1/11/17.
//  Copyright © 2017 FormuladoresDiscretos. All rights reserved.
//

import UIKit
import Cosmos

class RouteSummaryViewController: UIViewController {

    @IBOutlet weak var starView: CosmosView! //Missing method for data capture from stars
    
     var route = Route() //Route instance.
    
    var review = Review() // Review instance. Object to be sended to the model to be inserted on the DB
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var timeRecorded: Int64 = 0
    var distanceRecorded: Double = 0.0
    
    
    var timeToShow = " "
    var distanceToShow = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        timeLabel.text =  timeToShow
        distanceLabel.text = distanceToShow

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitButton(_ sender: UIButton) {

        
        self.dismiss(animated: true, completion: nil)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetalleRuta", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    
        /*
        *fill the review object, and send it to the ReviewSaving model
        */
        
        review.userId = 1 //set this later
        review.routeId = route.id
//        review.comment
        review.rating = Int(starView.rating)
        
        let reviewData = ReviewSaving();
        reviewData.saveReview(rev: review)
        
        
        navigationController?.pushViewController(nextViewController, animated: true)
    
//        route.rating = Int(starView.rating)
//        print(route.rating)
        
    }
    
    
    
    func getRouteData(routeData: Route){
        
        route = routeData
        timeRecorded = route.time
        distanceRecorded = route.distance
        
        
    }
    
    func getTimeDistance(time: String, distance: String){
        
        timeToShow = time
        distanceToShow = distance
        
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
