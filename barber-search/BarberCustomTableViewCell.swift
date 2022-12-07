//
//  BarberCustomTableViewCell.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 6/12/22.
//

import UIKit

class BarberCustomTableViewCell: UITableViewCell {

    
    
    //@IBOutlet weak var barberImage: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var imageBarber: UIImageView!
    
    @IBOutlet weak var direccionLabel: UILabel!
    
    //@IBOutlet weak var direccionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(barber: BarberShopModel){
        nombreLabel.text = barber.nombre
        direccionLabel.text = barber.direccion
    }
    
}
