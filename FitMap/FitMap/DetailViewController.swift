//
//  DetailViewController.swift
//  FitMap
//
//  Created by fitmap on 1/10/17.
//  Copyright © 2017 FormuladoresDiscretos. All rights reserved.
//

import UIKit
import GoogleMaps
import Cosmos

class DetailViewController: UIViewController {

    // All those vars will need to retrieve values from database
    
    @IBOutlet weak var routeName: UILabel!
    
    @IBOutlet weak var starView: CosmosView!
    
    @IBOutlet weak var avgTimeLabel: UILabel!
    
    @IBOutlet weak var recordTimeLabel: UILabel!
    
    @IBOutlet weak var routeLength: UILabel!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var routeDetail = Route() //Route object
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        
        tabBarController?.tabBar.barTintColor = UIColor.black
        tabBarController?.tabBar.tintColor = UIColor.red
        
        // Do any additional setup after loading the view.
        
        starView.settings.updateOnTouch = false
        
        starView.rating = 2 //retrieve this value from Database
        
        
        //Drawing the selected route on map
        
        let routeData = RouteDataSource()
//        routeId = routeData.getRouteId()
//        routeData.drawRoute(route: routeDetail, map: mapView)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setRouteToDraw(route: Route){
        routeDetail = route
    }
    
    @IBAction func runButton(_ sender: UIButton) {
        
        //Instancio el controller de RunView
        //Paso objeto ruta al runViewController para dibujar y
        //mostrar la data alla
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetalleRuta", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RunViewController") as! RunViewController
        
        nextViewController.setRouteToDraw(route: routeDetail)
        
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
