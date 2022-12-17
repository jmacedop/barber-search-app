//
//  ReservaViewController.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 12/12/22.
//

import UIKit

class ReservaViewController: UIViewController {

    
    var lista:[String] = ["Michael Mac", "Lucas Moy", "Rodrigo de Paul", "Fernanzo Zamora", "Martin Palermo", "Federico Valderrama"]
    var checked: String = ""
    
    
    var cortedetail: CorteEntity?
    
    @IBOutlet weak var tableView: UITableView!
    let barberosCustom = BarberosTableViewCell()
    
    
    
    
    @IBAction func reservarButton(_ sender: UIBarButtonItem) {
        print(cortedetail?.nombre ?? "")
        
        // create the alert
        let alert = UIAlertController(title: "Reserva exitosa", message: "Corte de cabello:" + (cortedetail?.nombre ?? ""), preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                    
                    // do something like...
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let view = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
                    
                    
                    self.navigationController?.popToRootViewController(animated: true)
                    

                }))
                // show the alert
                self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var corteLabel: UILabel!
    
    @IBOutlet weak var descripcionLabel: UILabel!
    
    @IBOutlet weak var precioLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()

        // Do any additional setup after loading the view.
    }
    
    private func initView(){
        configureView()
    }

    private func configureView(){
        
        tableView.register(UINib(nibName: "BarberosTableViewCell", bundle: nil), forCellReuseIdentifier: "BarberosTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        //barberosCustom.delegate = self
        precioLabel?.text = String(cortedetail?.precio ?? 0.0)
        corteLabel?.text = cortedetail?.nombre
        descripcionLabel?.text = cortedetail?.descripcion
        
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

extension ReservaViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BarberosTableViewCell", for: indexPath) as?  BarberosTableViewCell {
            //cell.setup(corte: lista[indexPath.row])
            //print("Hola")
        
            cell.nameBarberLabel.text = lista[indexPath.row]
            let nombre = cell.nameBarberLabel.text
            print(nombre ?? "")
            
            //var selectedIndex: IndexPath!
            
        return cell
        }else {
        return UITableViewCell()
    }
    }
    
    /*@objc func checkMarkButtonClicked (sender: UIButton){
        print("check activado")
    }*/

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
      
        let mySelectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        if (mySelectedCell.accessoryType == .checkmark) {
            mySelectedCell.accessoryType = .none
        }
        else {
            mySelectedCell.accessoryType = .checkmark
        }
        
        
            print(lista[indexPath.row])
           }
        
        //let barberShop = lista[indexPath.row]
        
        //performSegue(withIdentifier: "PresentDetailsViewController", sender: nil)
        
    }
   
    func taskDeletedTaskDatilsViewController(_ viewController: UIViewController, didDeletedTask index: Int) {
        print(index)
    }
    
    
/*extension ReservaViewController: BarberosTableViewCellDelegate {
    func postStatusBarberosTableViewCell(_ viewController: BarberosTableViewCell, didCreateStatus status: String) {
        checked = status
    }*/
    
//}


