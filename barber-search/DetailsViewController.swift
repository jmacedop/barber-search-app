//
//  DetailsViewController.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 5/12/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var direcionLabel: UILabel!
    
    @IBOutlet weak var distritoLabel: UILabel!
    
    @IBOutlet weak var horarioLabel: UILabel!
    
    var barberShopDetail: BarberShopModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    private func initView(){
        configureView()
    }

    private func configureView(){
        
        nameLabel.text = barberShopDetail?.nombre
        direcionLabel.text = barberShopDetail?.direccion
        distritoLabel.text = barberShopDetail?.distrito
        horarioLabel.text = barberShopDetail?.horario
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
