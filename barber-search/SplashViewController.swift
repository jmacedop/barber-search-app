//
//  SplashViewController.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 14/12/22.
//

import UIKit

class SplashViewController: UIViewController {
 

    
    @IBAction func next(_ sender: UIButton) {
        //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        //guard let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "HomeController") as? DetailsViewController else {return}
        
        
        /*guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: "HomeController") as? HomeController else {return}
        
        navigationController?.pushViewController(nextViewController, animated: true)
        //print("hola")
        //performSegue(withIdentifier: "HomeController", sender: nil)*/
        
       /* guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: "HomeController") as? HomeController else {return}
         
         navigationController?.pushViewController(nextViewController, animated: true)*/
        let listaModulo = ConfigurationListHome.makeLista()
        
    
        navigationController?.pushViewController(listaModulo, animated: true)
        
    }
    
    
    
    @IBAction func holaButton(_ sender: Any) {
       /* guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: "HolaViewController") as? HolaViewController else {return}
        
        navigationController?.pushViewController(nextViewController, animated: true)
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
