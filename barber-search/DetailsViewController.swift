//
//  DetailsViewController.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 5/12/22.
//

import UIKit

class DetailsViewController: UIViewController{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var direcionLabel: UILabel!
    
    @IBOutlet weak var distritoLabel: UILabel!
    
    @IBOutlet weak var horarioLabel: UILabel!
    
    var barberShopDetail: BarbershopEntity?
    
    var barberShopManager = BarberShopManager()
    var listCortesBarbers: [CorteEntity] = []
    var selectedFilters = [IndexPath]()
    
    @IBOutlet weak var tableView: UITableView!
    
    let lista:[CorteEntity] = [CorteEntity(nombre: "Fade", descripcion: "Rapado arriba", precio: 15.00),CorteEntity(nombre: "Roble", descripcion: "Rapado arriba", precio: 10.00),
                               CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00),CorteEntity(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    private func initView(){
        configureView()
    }

    private func configureView(){
        
        tableView.register(UINib(nibName: "CortesTableViewCell", bundle: nil), forCellReuseIdentifier: "CortesTableViewCell")
        
        nameLabel?.text = barberShopDetail?.nombre
        direcionLabel?.text = barberShopDetail?.direccion
        distritoLabel?.text = barberShopDetail?.distrito
        horarioLabel?.text = barberShopDetail?.horario
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //var lista:[String] = ["", "b", "c", "d", "e", "f"]

}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CortesTableViewCell", for: indexPath) as?  CortesTableViewCell {
            cell.setup(corte: lista[indexPath.row])
            //print(lista[indexPath.row])
            
        return cell
        }else {
        return UITableViewCell()
    }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let corteEntity = lista[indexPath.row]
        
        performSegue(withIdentifier: "ReservaViewController", sender: corteEntity)
        
    }
    
    
}
    
extension DetailsViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "ReservaViewController"{
            if let vcDestinoDetails = segue.destination as? ReservaViewController {
                if let corte = sender as? CorteEntity {
                    vcDestinoDetails.cortedetail = corte
                }
            }
        }
    }
}
