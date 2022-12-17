//
//  CortesTableViewCell.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 7/12/22.
//

import UIKit

class CortesTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var descripcionLabel: UILabel!
    
    @IBOutlet weak var precioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(corte: CorteEntity){
        nombreLabel?.text = corte.nombre
        descripcionLabel?.text = corte.descripcion
        precioLabel?.text = String(corte.precio)
        //direccionLabel.text = barber.direccion
    }
}
