//
//  BarberosTableViewCell.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 12/12/22.
//

import UIKit


protocol BarberosTableViewCellDelegate {
    func postStatusBarberosTableViewCell (didCreateStatus status: String)
}

class BarberosTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameBarberLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var barberImage: UIImageView!
    //var resp: String = ""
    
    var delegate: BarberosTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       //var resp = ""
        /*self.accessoryType = .none
           if selected {
               self.accessoryType = .checkmark
               //resp = "HOLA"*/
              
               //print("Hola")
           }
        /*if(selected == true){
            self.accessoryType = .none
        }*/
        
        //delegate?.postStatusBarberosTableViewCell(didCreateStatus: resp)
        /*if(resp == false){
            print("Puedes desactivar")
        }*/
        
    }
    
